Return-Path: <linux-arm-msm+bounces-115686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jn3aLRH6RGqN4QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:29:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE446ECD32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:29:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=btvhzGAd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=URiIdti0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115686-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115686-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EDC7F3020B99
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32525477E48;
	Wed,  1 Jul 2026 11:25:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22968477E2A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:25:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905149; cv=none; b=H9Hqx+/x2EMw7IkHrrM9O69yX3arYriWhNX0mXfkbrxDdRJ6kPiwHRzT+0tSzBYd0YHC0wtBhzWHwgU0J/YDF+2AiHmeMpjDEEGfi1qa0upu3DSndd7kxbfTNkGYeFtUxRhsUceqfXmPN7oweYjqmdYEGvlSWjg/Vc90nb99R+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905149; c=relaxed/simple;
	bh=XudXR1HBMbCADHdNf590L/1MSAwAvanH/ANUsrF7i/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eju73dkL7qVMzWpPdZ9wlwDggar+muKIDxY0OBRJ+spX/DCV/JkYkJNEb8ntPIjSTaEmOBdVuI9Lyjct3GMPDWZGAJHvGxQ6yUFCwJb3gUvq62ybTPjkMNf6FOI+cCMSICKDW6n0p8p9qeOyAwAMy8UwaG3HmkrjJ0wFlUpZPZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btvhzGAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URiIdti0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8YYD762016
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AulWVLyhCXJzuW3ldtc62yyZS4Q+nukpT7VtxUpyNkY=; b=btvhzGAdmNTYrooc
	1F9eAqscwKm1HHKM7UXDptcJaErLjtVSKYlkyJsMb4P9J2Zr8dOOhmrwRXcp0LIP
	tt2XyWwCuhouPm/ufcycbmSpKTxLGpCzDTgvkMCzStIixJsBcIvN9ZYGxhDyfD8q
	dDWw8wNtlSpKQ92Uzv9nk0r3z9MVv2aG0u+QQmpRkGGMkQ0+QtBhe5z6xzbXfUhs
	EdP+4UBpmC7EZ0Kgoby1PXGDoCAwb7HYHnn7c+UoOQKTUP0SStKVus7eJONrCuio
	aNQ1cDNdIHbgY72gHy+K5toSIjCarm83+iMqRStFAtd3GtFXT4xmyfCNSB5Z6AHP
	TGH1wg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd0bfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:25:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e777a15so1072221cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905144; x=1783509944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AulWVLyhCXJzuW3ldtc62yyZS4Q+nukpT7VtxUpyNkY=;
        b=URiIdti0ZqJJiv30m4r+eHR8Ev8ydKQd88qLLAxcX8xupu/QEvFSMgdeUEGrhFXZzQ
         jpmqsdgigsVFdcnpJqn5nVnvCd+EQsYpFMvITBwbLkbZDMBYELUqOXIii0LvmqTPjuiW
         XGJTVKwFLKBc74iqv6fA8Doqmt9v6XdOxlZYz/5uXThS60OJ0qbQ46ISSmnj8krCDfuG
         0nueseSrdCIvihcli3XFJ0xjS9ckCt521CU3xNioCamULVvnDFRl8AoDD+Wd0ZI7L/PD
         nLSbrUfRQ3k/rnpbdZgCNwnOB9/bF5c1TR+wsDbLGJFa56nXq39Lsn3bMNTynvGvOxyj
         5dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905144; x=1783509944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AulWVLyhCXJzuW3ldtc62yyZS4Q+nukpT7VtxUpyNkY=;
        b=Wkv3j+AZBgDisKZhDjb7302+nIRfYYZy5kZkAsA3LvVkLAPZQ5GGheWeTGdZo0jAOC
         Bw5frVVQI+69FVfz4s57gr2TQjwKncEOqYTSSLa3kiQBXbN6N6/TpZM2lA5j0kRuDOjy
         x8OoY29ZJBLd+WvfaYg6qgMJsbEWgfnl9Fi8l0W725EVuu7mSiAvsXOamuka19Y0ewMk
         +nx61YaKuCNR7JDow5Z6cBDQn1RURUz76x+JpGbejYgFLUjOfO57UFgfiEd0QqYp8HA5
         Hg3Vj6U0Kxu4JVtLhYEV824NvMG+4laJoyKbAiaeHH5Jy44V+bE9YHclHybwWP3PPIeI
         A1gQ==
X-Gm-Message-State: AOJu0YyKvfV788ug5O7k1zAWoFjo5Top91ISVDA8hK0zwzIAv8LHPtVg
	FHQT8k6JpA4OOftcwdV5tszfrzfAfFNfGBj5V+qo126QqHc9mBgyTSG7kDEPNw+F/5gglTR8pYs
	4TCItePPZP9eyfF/QrCz44iViwjQHeHFbaZCf/bhB0AvO9qsYe8Xo7nRZO96fZVbfqtSq
X-Gm-Gg: AfdE7cn7k4j0kC7us0WahfqntlRU43wHDpWlTG9b5idwC9e6+XJL62TlpvM6SdOGA6q
	u5D7Y1rdMVktGeVQ3EbNdY7ET9JVGTUPqmbzBc6p21Z8ofMeHnxNaFTV4LVUBwEH8g6KbQd2BEh
	KD+Ro6rMUhgUcIBetje+M9bWFmLOIbXqGJaP1Eq1AeWTKZCPAc8+03wa3VTxBQVBtKjDT+gYpp6
	xixUt8AWVYWQB5o6ebSn/Z/byDdzW/WHevWhshCKuarHi0uq0bcoIWHF+ii2qUYoSXWB+uTBiTu
	xddrQt+4fslQRUSXjTgLpTFDYg5Y52Djqox64e0t3ChA0Y9mP3aDKdKddrb9XwxhEowZNB/G28R
	F/r2JTTQr0VEGMW82ttocMfRmxPunSRBEV5o=
X-Received: by 2002:ac8:5ad6:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c26a45ba4mr10768641cf.2.1782905144328;
        Wed, 01 Jul 2026 04:25:44 -0700 (PDT)
X-Received: by 2002:ac8:5ad6:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c26a45ba4mr10768301cf.2.1782905143868;
        Wed, 01 Jul 2026 04:25:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm258210866b.51.2026.07.01.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:25:43 -0700 (PDT)
Message-ID: <ccb81ed4-e8f6-4e02-90e8-2433e59846f1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a44f939 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eoxlGDcgPB-HuCwanXQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 48tuTvQ4EHd52VzOmKTBcXgECbNqAooR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMCBTYWx0ZWRfX0QPkRnrd2T3V
 BaSmCUynkWdA5MjSp7mUE12pLIaNcto6l1H9ZLkVdBc/bKIX7umpLoRetpzZgT03RaqIfARLq4/
 kwmWRWxWCxGez7SRCj2PWwcPfPhzVuA=
X-Proofpoint-GUID: 48tuTvQ4EHd52VzOmKTBcXgECbNqAooR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMCBTYWx0ZWRfXwjkmkiPt1tPp
 DYrPj7c7kNBm6yqVPK0GhLqQStww7JsIS8E0KdTCKDtS8Yu5r7KKFWIapI3n9Jfn3Cnjyzs/bFA
 khm6iaSifM5jHxS05zIud5Quf1R9O4lgeZFKSF+1hwRtyf+mmuvgMkl8a2cmVlzUV/cgIFId07D
 GEa2EkDVz1u0cCn0gkYaAz183MZYRsd/7CEf5YWeM4v8SIqyh3DPw5OvxyrT7tFqPaMCEBR79Fm
 r8m1MxFh697PQ7kHJJPbvHaDEb3ZuS4U6sTM21I3SIZnyQoGXrxovSYFbmmvrNLGXxz47d7prg2
 HnFtaRLFI4QoD0VCz4XFcdFdpE1m0Fxj3S2NBK/QlvW+7b1I/thF32JarvUyPdbLeqR5HuweHIB
 2gXwwo6M1IRXj2+05Hr5fEq68tbIaHgAPEiDttFgd8vBKwUD0Z9cLM7jWacFdttIp8wLT6zxe65
 5B4ZSLA5AvgYjMjwNdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115686-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEE446ECD32

On 7/1/26 12:28 PM, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Introduce per-compatible regulator descriptor data to accommodate these
> differences. This keeps the existing PM8150B current-limit logic intact
> while adding a dedicated voltage-selector path for PM4125.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



Return-Path: <linux-arm-msm+bounces-112377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PY+AJLAoKWr0RgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:04:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91B6679B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:04:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ORWT8b1H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E3mP9Rn0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112377-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112377-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E554A30FDDB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456E43B42F8;
	Wed, 10 Jun 2026 08:58:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F63AFCFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:58:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081896; cv=none; b=oLFumHYRtAuo8Xz3C0ssw6aaW7axIU/J0THGM9QOmYhEv0KlRLr2wmHjhWMhgvfohHeLnDKyueWFDl5DY+p2+XcN2mURuGpZ5cdisAkAhCzF9P1HLsecBq1zJJcgwMVpOxJKgNNF4nnBZTfJWFvJe+vbAW8avv8omrGRw/2hUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081896; c=relaxed/simple;
	bh=QAyghAcVt5eMp9xbZvGFYS2BVeiVvAYw2ldCx0CAKus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0BgZxY0AHM1yXquhLfHBpa87RCfGUlkti2uG1ViX8TWRsT8HtNmDSbDU0Tpz2xVbXeZ52ofsp6PfK+VMGpRYy//T5pPZ/EATovq2S6rcddBKdOhjwUQkrqYKlamJgVByqTJoO0+EiRwGsWfXh8cuuLZ0NE0sJHdWUX0XF9RWpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORWT8b1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3mP9Rn0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iWf8904101
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=; b=ORWT8b1Her7iCjpe
	qSOyQ7/l/JVGS8CYfWOEVjftHWxF9YmnMcdT5D/7ZVlUJUU6AI2eGoF/BliQl9bD
	LZIaPb6CZASgxFy5ZqMNVZ/a5sW8e/XOTs6d+sfSmvJAzHlnotQRhZjL3eeCtUh9
	sBSiuoVuWsTWg3Ud73ALGRoFK4SX2SDHBVCwu0Vm+bZlYgqYEbp65JF2BCHJlqH8
	hC8kcmKBqLZ9oLQKh4/dD8GDBE7kVZwDM1GIeOwvQS7KVdmSD/i8Fpo+VPO2dVJw
	S2fNjnbXVmNhs+QHDWX8K87BKOXflSzaZRGyKwMW1xsHMhu9clhtJB8i7i/6m07V
	hfBdrw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuket5aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:58:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517796be724so13165151cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081893; x=1781686693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=;
        b=E3mP9Rn0Cx6Dj5QK1L0IcgEW7bOqoUqxwIyzYjL//oOrckfmnI2/bGvcyR7GZ0dkIh
         uuVOuTGZufIjcrT4MzpkYvwmEwzqDN6ZbMWZOwtoGythy4U8N1tMDoYPE4tK3ZwwcGJO
         mID9aIhq8783Jjs+ffMT04h51s1stBuyl4Wz2j9GVMrYkEpv+d3mgqEvWUIPEF0UNd67
         0X+6orPjD+muaWAMYNCGX19QdE/dCf2pwWZ52SEEVh1hKEc2hjEqqWoQJ9db0Kb2xLvQ
         vDoOpa6Iz3IvkU5tdAUv342objjimPX1SQx8piN389yQkVLzAGc0Cy0HPe51cJRa0bE2
         uLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081893; x=1781686693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=;
        b=Jlpmf5zt2KEdvylavpOXvfSCXu8b8PMP+3+umDCLROYN4P3ytn4MK0Kjn2+R97kCLU
         1c0uigVjint6BgTGruuV884btUoY/wPcWWDwChgmRX48ZNN6t+fWBOVHcsb2RRJrvDpC
         xFWeYh8BazrMUjpDbrDpS4IWrbgexfwoInaCRu59GfxdXtDKN9hDKATvWVUsrYKm+VmU
         pGuz3r8bWuVM9irAlIYtzwCp0bzZcqOQblR8hCYLTmkdaaOpDxRwyqecMc41veMkF2ht
         kpdW7zf0fxj46ppdlu3G0+7qKCoqRKU4TRHaqPoHdo3lCVztZPbMmtzeLPIwNUZlSe02
         7C/A==
X-Gm-Message-State: AOJu0YyQkMTSY+99AyCcbOqBJFksQTk6xXA++NHyl2TAb4/lILSaTg+X
	1PYqdnJsVGZXgMDBXCbyA0mUQ6Mk6Sl4aVwIPyC68GB30LlwWZIPrgYQBNi3HIuww4icXFzUXUb
	zdqX+7XWBF+2AZ5zWZ1QDid/D+r2hyMB/ciho5GnLIctBrWnZdo1JswxJXNGCVIYirOZx
X-Gm-Gg: Acq92OF23IbMfDpymbJYjPiKMDgadod6rtj6ICO3cdLo8YTzB0USQyr7RtRgN0ZH0Mm
	ZQX985SU34dfvWPXIuPw+/wrcN287ETw3CaNqUmBR5PxhsLLZItDobI9HIbKbODMeCvTMUvcFl2
	qSCaoNkk3pRd5QgD0y5oBn2y+pyfiTSSJW6zLBexV/hm1/MDgOWM4LvkLlVBt0Mh3MOCWguOykt
	8scV3/QDKBh2Clkkf2InritCrmt9X564t0C041b6KgHumw4+9sSiZw2E7jWi9r8oDwz9hcXywUi
	gYMUJHxdafbn4b91VSjCeHzNiR5sKjWUK2AkYT/kx74ZC+w/lXd8+gfc1NePA4+j1n9EYlPLb8p
	aXK2Q1hbXv885Gxev7D1TYDJIcgudtiIjibmeWZrn606a+Iw+ue4xmkbF
X-Received: by 2002:a05:622a:11c3:b0:517:6162:daf5 with SMTP id d75a77b69052e-51795c1a37emr195017681cf.3.1781081892872;
        Wed, 10 Jun 2026 01:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:11c3:b0:517:6162:daf5 with SMTP id d75a77b69052e-51795c1a37emr195017481cf.3.1781081892417;
        Wed, 10 Jun 2026 01:58:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559eee00sm1168984066b.56.2026.06.10.01.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:58:11 -0700 (PDT)
Message-ID: <a4ad1686-4b23-4521-a69a-f4468066a07a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:58:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
 <20260609-move_perst_to_rp-v2-2-6c731523d08c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-move_perst_to_rp-v2-2-6c731523d08c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX6O6zyufx8IXC
 3Ch8gqmUf98YmSTGvKijPgAAHZ4jXOfWR7f8fy4kKVns/Ju3+Mz5q2yGZ7ZZm22a5w9NP6gFaM/
 NPeRC1xI+hZ5gKtZQUfVTh4ccLm6F5CqmfIvWXX6908DB1nXeX+AjqCUQUKFN05e7jD8JgZ5p66
 PhLNcupU2qjViTytuc+X8VtMTiIOF41ilEhagGfuF9hxOniexTROUYC5pt5xir6cmr+md4hp98J
 xzAC8LgdewiXbrfOUpAv3tRY5UA85vOXX5a7EsJc+i1aN58L2BJ0UwxSk3nwfrFQKQ5cxmS5Ft8
 +3inO6NbQBjETGGxHX436R3J6/+VCMOgWuZtxaYpl03abaZp3L2ly+Ap3709F4jW39tVINCQ79q
 A0BnDD2BNOzrPlHmnzvl9QffEyzzDttoaI1Ri9WfZbN9bGVr2GVNmktgSoPRl1rlpPH53rpQ0K1
 Ce9MhbGfDMmi2rMRLSw==
X-Proofpoint-ORIG-GUID: YevKAXysu4zE-I-NC1l_EhhKqFIwKlZu
X-Proofpoint-GUID: YevKAXysu4zE-I-NC1l_EhhKqFIwKlZu
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a292725 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=b_Pr7HiucSRPs_5II3MA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112377-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B91B6679B1

On 6/9/26 7:04 PM, Kathiravan Thirumoorthy wrote:
> Follow the new binding style by defining PHYs and PERST# (now RESET#)
> under the Root Port node. Avoid mixing styles and move these properties
> to the RP node.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


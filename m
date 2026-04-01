Return-Path: <linux-arm-msm+bounces-101333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN+IBLEGzWnhZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:51:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14F379D69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E87273009F18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBF23F7E85;
	Wed,  1 Apr 2026 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pj3fby0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4hNjdc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6608E3BBA0F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043665; cv=none; b=deeZyKk+cCjiN3XW9eprpK0/lL1oGxBUYdydhWCI9jCzn8S7o/IU2rc5KfJVAJTE/GVEY4GpaK4t3DmUKhFcVS8eoH0X/kPc7wF5yb+s7N60yCiCB5kHA8kmtKkcBCTDone1gmViWF32lXawG6tAmYRlDpw11TjdZC47vqjXU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043665; c=relaxed/simple;
	bh=9+wmrLVVKTWSQFvNMtg3IxNd0qr/4JOuXA40u2uRsgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2PosWgQTBQJNa5+y0EL1IuLHZlydryIneNuLA6QG5CmUgf1IPZDnwUYmFuqVh3B02Ml94/W5UPI77XiAUShkL6CTT7EIs5JO76+pMJ1tXFS/CzkmpBi9JPRmJkLOaczzE7rrTUVME+v8w8maKFoqZID0XCfh6t0GKWk18Vz+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pj3fby0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4hNjdc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319fk8D1580391
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xv5fQeIVFcuEhKMqH26LWCz9Pa8e6RKtrBukupBsfME=; b=pj3fby0Irgn6cFb5
	wKDjUOf6IJo1vkaC+dyrvZMtL6LKczqA+0o1O7D7ubjImWEN7PMAJglXMwbfm5bB
	NBcigQZ0/RTlK0xYcKyndO+NHSahhjzTMvJbh4u1m/ZeeRshDualqVzDWzU8fawz
	7oJ01vtCl5tzI1Ry0JxfJTmaNKddro5oAx4yqs9r1RpPtq2QAJqM93vZjMl3VVns
	vDNggPaA7nhH1KIyGF8jGukZ7YkTkWBGaKWF4cAmZRmhowd+MNnHCd1juuDPykUE
	m5oCDLRWial0dMZr1/lN56gRDl10UGRMA/QYU9gJoZ3nZp2qYUdl+KKuDCxGNfQB
	rrZXUA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2u9we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:41:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89f548d0872so13073126d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043660; x=1775648460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xv5fQeIVFcuEhKMqH26LWCz9Pa8e6RKtrBukupBsfME=;
        b=H4hNjdc9kPOnssLRmAv0xmmaTdRf8P96r2YBXiAfXhYijsTfNdhJifpT/XosB1wweE
         Gw09uU2sDAwgGMUobv9feaZ43HzpbQJQrKG/dIqWqz4+2e0Lh09aKWB2I3Vystdgp2RN
         gIzd2s/lAFcDi5d38C3AHMNWX94xx9LwHw8Gom1lTfJF00UDpyX9IE8rlR4XiTzuZkFM
         4yFOXGAShYynLTAET/FnoC2y5mtgJlHDeup5r1J8aaSOkt83X7bQx8xUyuNtYGja5e7s
         Qnq/EsTet5QA9MDQrNfPJ16H2+BugPpUundxQZNhiaZKdAHMVNa4LvLhCMhxlVPcPcNT
         kp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043660; x=1775648460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv5fQeIVFcuEhKMqH26LWCz9Pa8e6RKtrBukupBsfME=;
        b=Miyo+7A1j7egB+EbJOESUvU/L3Ep0iZjeS8rN5B9y4r/prL3tF2YGKsUVK996o/ZK7
         eaZw4iV1trKwsTSSCiAfmrN/zB0U94qbn8lpsTH7miRJmMxJrwMIlqXAc0cm7nF7MoIY
         BX6N3/CPjvxKCutzk0oqfZ5F2Uj2cdh8XIp4ioduFLQX6l/k33g1yZBsCq5W3B97Sa1+
         rx1kls1m9Q89KfLsov8Ej59s7sOO9Hcr8hEDDX8ywiu93MaF0m2pLV/NV3L53QcHIZj9
         +++3sNSMD+DG259KZTrhoYJD76FBa3utTnWBIou+iQh92bX5NP8iDwHRnFT98aS4GbPS
         9fXg==
X-Forwarded-Encrypted: i=1; AJvYcCUTlorwy235/z1CKrajSUufVckwHC2iSFUzBVIdnlYT4uL1GH35H+2ygBb3t7L6EGADuCN+afxZzWsS29hm@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSfQ8hn1HhyNitVjm4394BvWnWrn71yvsdmPH8NRiBxcpBPk7
	dF9Pvo5mgqbA8X3iq9Air4n+hDk/nrbJmY+DQfXAMkj9SCx1TFrGhABu9RhfRQrzSUydRm8xFVt
	Bv7EXBZR8lkrSZV2TdDHdyqQdc0GkusGhM0wNTSXNLh5VxmylBRwR4tX6yZDt4ioHj98o
X-Gm-Gg: ATEYQzzgOEY0HV2RaqVC526bFvpxLuIskTXRTrutTyt8HtKC8G0gkZRPJdfQHKVQ5f3
	L3/LtXpF1pVas2t1DR8Vjji3+grx6tXy4WC4/9jvSGS+MaUI0/NIEaZhDpHvHI7+P4qYLXKP+Bk
	q4BpDodCfCW+cwkzKZc/9qpQLX6lrfDoOTtXTTBfUAJ3KDfkEH8eWufCUu8svoGHWO92QyKHUnq
	G+FPA69r9I0hrsgZQf4T1rPeT3rcnF8g9/pU1FaSSyxvTXTB+ht9CDW4cVPdbaImRYex1FqnS1k
	vWuujsrmUE02YXRFEjWieg133eoFcy5ckcnYQ2W6vDmQ962+WTYlZhdaA71krWwblNeTR3SO8uC
	WjrlIkl0U6AV3ys+ju4OEVcrkT8hyZmyEVpldgKnRdwS8de2muBvFcqXC7V/CSMKfpYQJEPUwVd
	79IVs=
X-Received: by 2002:a05:622a:1c05:b0:509:a3c:e390 with SMTP id d75a77b69052e-50d3bcecc15mr33113481cf.4.1775043660265;
        Wed, 01 Apr 2026 04:41:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1c05:b0:509:a3c:e390 with SMTP id d75a77b69052e-50d3bcecc15mr33113261cf.4.1775043659901;
        Wed, 01 Apr 2026 04:40:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0219ed95sm137701066b.29.2026.04.01.04.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:40:59 -0700 (PDT)
Message-ID: <7b271810-c1ab-4d07-8364-e4c30588722d@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 13:40:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb
 session slots
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
References: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
 <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cd044c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZEI62NPqEYiQVTBb8BAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 4-clLt6vzUT5cXl7OnSfeKPBWAy74EDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNyBTYWx0ZWRfXyKO6FGX7oPR1
 lQ+d1uRuxgfcN7aHnkocCtw07JBWbu00aqxtXs1W1YEixiXx/v3Q3uhYK9AZ8iKtE7vicaplfH9
 NavqRbn4PtVg7sCcc/Ki0TizSD2V/NTP6HDehFR1OICYHBY7Af5+z6l4YHbsploGqe7GDiHgUC2
 QCAj2VbQCbWd1g25Bf5ndDBbzcLg2S9EN0sZ2zeigzH0YkA0pgzli4y5S1zdVwIGFtSZs3XJuLx
 xKo6IY3VQH1+j3vh4XuWPA7nSze1pg8INeh7lVpIU7AgmbvMSaSLB2W+rGfFbC0ceAnxk9Kj/aV
 ANgnLads1F1o7GFxbUVg6YrYvz1xXDKtMvJg/1YTIOmy5K4irWYmSk40Jkzo34U17+w1Eui0OeV
 6ZGDpWBkpKljVdGpa/SGhys+uZfyIudRxQjd3jfIg3nYb8Iqw+kCvD1MLRMOr5k0oWdtJj0TUkY
 Htp4O5IK7dFjkUtgPrw==
X-Proofpoint-GUID: 4-clLt6vzUT5cXl7OnSfeKPBWAy74EDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101333-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B14F379D69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 1:33 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 03:33:45PM +0800, Jianping Li wrote:
>> Some workloads on Kodiak can exhaust FastRPC sessions when multiple
>> compute clients open contexts concurrently, leading to -EBUSY failures.
>>
>> Describe the compute context bank with qcom,nsessions = <5> so the
>> driver can provision enough session slots for the compute-cb instance.
> 
> This is a software property, so it probably should not have been added
> to the DT in the first place. Can we replace it with the driver code,
> allocating more sessions to the last CB?

Nov 2025 => https://lore.kernel.org/linux-arm-msm/53644b36-2eff-4b1c-9886-591afee8b589@oss.qualcomm.com/

Konrad


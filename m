Return-Path: <linux-arm-msm+bounces-116003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dd51ANNWRmp+RAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:17:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 882426F770B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:17:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FbkrEazX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e2MkOmRA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116003-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116003-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2299230B01D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B664447F2DE;
	Thu,  2 Jul 2026 12:07:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09BD42B317
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:07:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994041; cv=none; b=kg+utR2WidWfJfuZVkEoAWWEAXBn/pAwL1U8KOyAEquVbEBlNBZ36jitiuk4+WvECvcDJH3RNWbOdF6gauAj/rto2b3XQfXKkHsxW48hNkBhJFVsQZ5OzZXC/lbGU+FQrdmDxLneP+Eje30t1Q2jpghhG/3Nj6LGFpZXwu0j6Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994041; c=relaxed/simple;
	bh=2C6XjzLVn/DUO72k9GZ0t941Cgc1T77zwAvITnwzrcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBeCtwZ8mlLvCYrSNtRPfKlySjYz3uksrTE+im0GX0sJi8qPtajineC2luer0ZqqydF1LwoPOrJiBE7N4SDML1oge33UhSSXBr/puK9y/TsqZStJs/DxodPbkMLqNLWD7AklfjjuyyRtKjmDF0VGv3odl+HTmGsuCpA39EP9aTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbkrEazX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2MkOmRA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nQJU4139540
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOJwoCkAIusdGzHbjudQLH0WhneMpUY4FHhSIYQ8xfc=; b=FbkrEazXrEhwMupj
	aecSN4M9Luu5jFSOr7JPSRxil85+HbZJHPqiTRLjkUVN3wXZsUphN3TTO3AVUKZg
	nrof+KMfOzAwu1kr0MJUoJpBPjsJj8V10BvShu8aKQcv8fpfuswb3WzTZ1FMu8HL
	Xi+tJ4xXEfYcLZX1uPmgN2jMw9naZRXo4YVdhtMowhAGgTg/0mvDRbyTBA8kukMK
	Us5XUqHqwElwQ8Ey1Oz5xgA2yTojqPFoqKCuip7Mec6SMKLB4wPIiDTFOZAdaLsv
	9P99+mFAtwkEeyfinyPjQl2T/g0/M+L0V61d2Xo78nw/2cCSedCrFo1pkIWXnvGo
	utOMVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8g4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:07:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so4932711cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994037; x=1783598837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOJwoCkAIusdGzHbjudQLH0WhneMpUY4FHhSIYQ8xfc=;
        b=e2MkOmRAeEaQ9E+2ibN7Hz71vzm9YQylSqU+e2EjbX77Rlz0fLxTOrF4CdRjBWbU7j
         T1JiqAkRHe6F6mb6/9Zx4UsbmU2vQdAmaEwM8B/Kgmu3RAOy4y1Rh8ZPgsXzLnM3sMba
         F0dbxwYYoheFLzEehxB/GsP+2kh5t9khUiPHpOfPh3iZCjESk5SeMvLsjZNzuGiRmYAP
         NqvdX6g5lhetV2oDrSmAUJotN/76uLAB4Y1hSo2LWLx/pQSvuvQjJvcyjQn9OxcTJHFZ
         cfEev2QcLiku2R4IEE6+NxSLGo0B+j2rZbo2zRuuJCzmLwSLShGVCqlxt9PnAJvFrbgn
         Jdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994037; x=1783598837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOJwoCkAIusdGzHbjudQLH0WhneMpUY4FHhSIYQ8xfc=;
        b=kQTLkxAHslos9bc4B3tDCo9r2ic56XvakHRLC+o+sKlYr7TnYdH/zoRecQI8JCzi6F
         Rq7Ou+E/p0W6fJ6iDPxWArPyGKUM+uV+ZGDsxl+GfJoyESiyzND74FwGmlm2GvHgL9Wk
         DsY0LUnatvABhLUNSxl+YwGW4Ei1JOuMuupos2R7NfApc/G/3j23RSwfxQribKh2Xq0d
         mOd/PuasNBhihrcdxYR0xH6TRb2Dy7+lXJD8ThAwMNH0u+KAMZaLrZnb9Jm1ojHp/uKv
         Q0sL3SZE+Mi37crS8pvgCQJzECD1Targr1ld+FbtPX2URJ9Ybj2EMu/UF9VafwopUzzj
         mPVg==
X-Forwarded-Encrypted: i=1; AFNElJ91jPoOSWbm9H5VvclG+jwYxWbyYt5PojhbRgiHdGB8RwFDUa/2KirHXqbt8FWffGqcdu9aVdQ9EqvA6Zuz@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZN11p9jiMEeaMtPgs0QU2FUwTkgkmuEM3NpimiCDpv9kmNhU
	W7qRben3v2C6cHY/qai80s1M65GXrG5wlEHiTgY+rnZM9jyueesxTjdz+vmb8JvJzx4+d00ZdIx
	O6FFk3SrEVVR2jjny5etBR9G4gRoVC0/v09DhFCDdGNVtdFUbQ9OD09tf0mxwzMBg/7RN
X-Gm-Gg: AfdE7cmwjbuZzK5FAWNlUD6XhFNC4zO49rpk6stXQfRgy5Ui2DPjU3m8FF8Rq/Rnrfj
	II4IOAmSiVFwnnv7ZWwJ2JZbvQuWoCduTLNPhZwHah6XxbsQe+SKqxl8APW9Kj4kdGykw2dibHq
	W+JQhMxrD566UEYaU5/+ZdjkUaQtQ8tYQthcQBBxxHPBXSO1E82t8KVsofZJULdja+tLCPkZwMU
	LW+xop1zF6x6lyswK3JFUS24dz6PouEKYyCaLLCEsYvURdEOIdQvKvMIQw2Dra6gDJo2wHk3Sj4
	n1lbH2WVmfUOOqWFJoRZNhdiEfkqOh76tny6aq7DV9ugblYPN92DbmcBGIzZkeyLcNAUc4kY/4O
	EkAtw25r7sBgo+PdNxuFgMWbr+7sKx1PH548=
X-Received: by 2002:a05:622a:148e:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c26b25b69mr45760091cf.9.1782994036920;
        Thu, 02 Jul 2026 05:07:16 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c26b25b69mr45759471cf.9.1782994036193;
        Thu, 02 Jul 2026 05:07:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290794sm118186566b.38.2026.07.02.05.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:07:15 -0700 (PDT)
Message-ID: <4ab24c54-5e37-48df-a410-8fae6d7b5289@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
 <20260702073321.xsyu33rxtrku2xdn@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702073321.xsyu33rxtrku2xdn@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Wo6vYJZeZFplelRaPYL6zxGKy9zx2tH4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNSBTYWx0ZWRfX6yIH9ZMqWf6C
 5AjmvxKdf93pQ5M4eClohH28VDSQ6zrybo4NYcoWU2q45E3+HzvpHg6eM9M/ZLrFtgP9qjEOqjC
 KkA/ZUI+ovXEek6bkHInHXvIBv1axpA=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a465476 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3DGyyXRA4hY-B3Y99UoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Wo6vYJZeZFplelRaPYL6zxGKy9zx2tH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNSBTYWx0ZWRfX9hrfIgyAweB3
 zs8WdkYqdaFvnSYw1bsJMxhETI7WfCmdoq9QeFnNyw8SCkIdo37MKPGWkawSMRP6pmhUd1nDLie
 qQYTQDgiTeZ6IEtMLV8KC8Edql6/v4fE4eyjpH7u0sYJwMXNY4IVRJu/LzcmS9N3nQISzshZoRr
 1NC3naBZjCj08cVfwVzL2IpQET9sFyhTzQ4+pQBV1vUzpkmbnLdNUxSV6X8C8oF8SeViT/UuVHb
 ezfQvPcqJ7p+rSd+pwiJmZ0Gb7ITtA4waChZ1OlPSzbUL4hhXhQqGNZgX+9LjzTnyB2Pn9Fz2Yj
 n+WKQ2SXV35DgUJuYUsgfp8yGMY/R38lLB5e1zZf+DH1BjprIX9pg0FIdK09CFfPJ2t85nMpD0D
 X7I3jWlh5bmfhmnQZ2zOI6I13dOR7EsqY+uOP6YT5/NhpMEbAEWYVCAdWqHTOJCL6enEluQ+RYU
 aw1rig2ImDmY38Z13BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-116003-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 882426F770B

On 7/2/26 9:33 AM, Rakesh Kota wrote:
> On Wed, Jul 01, 2026 at 01:26:11PM +0200, Konrad Dybcio wrote:
>> On 7/1/26 12:28 PM, Rakesh Kota wrote:
>>> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
>>> constraints in qrb2210 DTS files to use microvolt instead of
>>> microamp.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
>>>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
>>>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
>>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
>>> index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
>>> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
>>> @@ -37,7 +37,7 @@ pm4125_resin: resin {
>>>  		};
>>>  
>>>  		pm4125_vbus: usb-vbus-regulator@1100 {
>>> -			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
>>> +			compatible = "qcom,pm4125-vbus-reg";
>>>  			reg = <0x1100>;
>>>  			status = "disabled";
>>>  		};
>>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
>>> index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
>>> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
>>> @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
>>>  };
>>>  
>>>  &pm4125_vbus {
>>> -	regulator-min-microamp = <500000>;
>>> -	regulator-max-microamp = <500000>;
>>> +	regulator-min-microvolt = <4250000>;
>>> +	regulator-max-microvolt = <5000000>;
>>
>> Perhaps that's a stupid question, but is there any good reason to
>> not just keep it at 5V if enabled?
>>
> We could hardcode 5V, but keeping the range allows clients to select a
> lower voltage if needed. The driver supports voltage selection per use
> case, so hardcoding 5V would restrict that flexibility.

I'm trying to understand if this would ever happen in practice

Konrad


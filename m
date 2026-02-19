Return-Path: <linux-arm-msm+bounces-93407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMj+Or4bl2k/uwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:18:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4815F660
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7D313001A74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDE233E34E;
	Thu, 19 Feb 2026 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMJB9Bpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ky61syfl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DF733DEF2
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510714; cv=none; b=f9m3PJUl6t67kHgLql4v80SY5kEvvi6CSNoRbsKuiMAFpuhMI4xqwSZ4M1VJSyjMlop9JZUyRYymQ2SUi4fo7gHN/RgmLVZB6kdI2EPS6SaQdieMLYn1uvOgpzTIqsCjSwQ4LmYb+pITaaEzEXdYXjrIpI0RYTAxh1obl4eMbuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510714; c=relaxed/simple;
	bh=l2+yFArAt6HLkcsncg+FDTIGCg0hoeriCBLtZp05nF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgfUOnB3lXPA8+J4AF0AKIrYIRCLfe2eJ9q74phQkZUzcYzCVa5lSXXksEToan095jGRxU06bLi9ZpHXF83NJ6J2tWuZIGwjDSRFe9ybGRSTKZ2IPIiT6iSjFg8GcoqSJM3hnhbrvy9RhnXRM9dXfOQGJG0Ivu4EJhV9ebAg4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMJB9Bpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ky61syfl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCdU6h3077574
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fI+C+WM3mKxwnH0W4AOtVbzKTZRTzsan7m781umLAjo=; b=DMJB9BpxMWLVLgv+
	r3jM4755MQco87FiotYp668gQRoT2lTX/MTV2GDE+/QLOSjAoOrnZtmqvLnnHKyX
	khmtrLnvN9TuZ8XJ09b8RKrg+JZNxP09b2dnaOFSWLHxwpRmV9GHqE0332mYrc1L
	I2vZzeznY/P8GesO+W6gp0oLES6j/lz6AkqUGPETfcYvo7Wrrw537E/RZ7Es6OwW
	C0M11gFDvzFB7fn1wX8GwQWn0qYi7eTCG+L+fhECyZDuR1MDh+7Hzmy0mHqqnxIQ
	I0DH9DWkR60G13IG3s/MfDt/9N9E8O6zHImDgzUrAeRLwCGPAMWsfF63bf4LvEAD
	ysHQXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk81rub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:18:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso94091985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771510712; x=1772115512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fI+C+WM3mKxwnH0W4AOtVbzKTZRTzsan7m781umLAjo=;
        b=Ky61syflwiQm/AVn3RfjsGYbmjyq0LqHLPPBeG96L5IYSmZShX367TTrQ8LKWTXeiL
         YRhjXfzkut53qj8jaEF94Jsbf+m2wblwKi/dzIkw37bPDth7geGhC134lHtyJJ/XUZfK
         zS1Fy7B7f+GAA9MueFdzlwawXqacvOZIDtZdQ5ZRKva4uJcYPhvtvv9g0fo2bTkq/82C
         8j6NjM8UfhjSDXKitM57T0DFhETzZnWmr2sfMCBtq6PzTD9+UpimTy7qr5lWOofW2S38
         ZVwIaMROC8TSXKDgUPUNQ0EucmaVtK37QdkOFSYI0/DP7fkKD+arh2H73urV1oAygCsi
         bJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510712; x=1772115512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI+C+WM3mKxwnH0W4AOtVbzKTZRTzsan7m781umLAjo=;
        b=Z99zBheh/bdCg20x2C5tQLshB191chvnf/9MtT3+efVvP54HWu/S+PwlTR2N4cAt3e
         x2advUa0M8yHK4n03uYCN1U3+14INmGfF1JEisRpeyigzz2SZYRfq8hrkeDvINlgEUoC
         ObfG5fBNsvWJThOXUGvA7dE0tNp44H3+w4Zhn02C6yRW7twF8BpHyUjRNzZwnJOniT16
         f4pdy+nTRxWH+UZ7Z8jP5jCT/+9tVqbLeCOz6QzvlScZIIosulWyYw0PfNRQR34AgCQJ
         xXdHTI8zyhZunmg6Mh3phvq6I/XA2ZNs02c85yVjxA183yFXPaIIDau6vz2fnL35J9BI
         6dlQ==
X-Gm-Message-State: AOJu0Yy/gEXHIneIjUqD0Z6C8jHru2Vhh5SNY6LjhAXSrdP8vw4i6hWB
	AVnos/JeCGpqzv9GwNlmn8Y7DbGrX01pC8Kzg3GM39XAjgoOYB6abE+qU2pOBotwFcfgiw2LcdQ
	IW5HjxTrGIA7NOeczdB03zOUWrOZ+1BJpN6P0Y5Cl10D0Zm2UNwsBmfdS41SDE+Xku9B7
X-Gm-Gg: AZuq6aLRo2Qxiv2CyVgbPRMS5wby0wap3+8V4aV6uaNc8S9iidfOKAv3XXq8Kj0V3fb
	k7CWftmp5rFZkkrIw4TfNEkCZg8bZPwpTdNNAwzd+xZMtKSmf9IFbqGS204c3SCjiQLZoBx0iRp
	c5hcAXY9R8z3JzSiki491BcL4sKar2d3lC4sTnfqwmUNEmi2UQZ1p1cAGGResyHhY1+mPkB8b1y
	5GMzb2K2Z7T0lov4LzJjD6JR1orCkH9TKbySVcnqTT/4jIu8M8GpSUBgaPpqLZmvq2WN4cSi+Yy
	+RTYiG7BT4RQ/QZLJj+KZnVOTkeUeDYLJT3Q1kmKgTgh98KvWA/rrQtMv5nrQRelS89sCkFMbd1
	9U8lxyymYHhF3fPvtKg+8CDQhZAEJetHVTsfrra0u7nW0RwPQ5Ssig33zNagaawuF0uH7ChXLBA
	wKZY4=
X-Received: by 2002:a05:620a:468b:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cb408c8f1emr2037397385a.6.1771510711985;
        Thu, 19 Feb 2026 06:18:31 -0800 (PST)
X-Received: by 2002:a05:620a:468b:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cb408c8f1emr2037394485a.6.1771510711456;
        Thu, 19 Feb 2026 06:18:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b2e35sm5303818e87.82.2026.02.19.06.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:18:30 -0800 (PST)
Message-ID: <e9d543b2-6412-43f8-840a-044257fa9a96@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:18:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] soc: qcom: ice: Set ICE clk to TURBO on probe
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
 <20260219-enable-ufs-ice-clock-scaling-v6-4-0c5245117d45@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219-enable-ufs-ice-clock-scaling-v6-4-0c5245117d45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PV56dK6MMbf9SDzT1_jad5jezYhnFjgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzMCBTYWx0ZWRfX1uHumBSsUxqK
 RMuWfWDjO/KlEgFAMSG5Lqjfrp4muOP1mAeacdOtZUtbQsfsSQWV4ROih1xps9KLOOyv5N/60Rj
 1Vy8Dtv41v9zwta6IUY2ozIX4ibeVVB/y8LItwY5/k5eq0bFQ+5FGhoxXli9X/nw7aiV4sG/Ja9
 v9dVFsie0i+C6cz92w5aeOnadr3KE370kpmH/Z3e1lliopq0HJByT7aNYkX/51unKiJiN9F98Hw
 tXJF9HgWpIi//tgGerzgpx07i1gUyfPTkpvdXnWvO2r3M6RdNamB/71FpsF+AIeKzrV5VsPgarg
 wdzu2egZzS8CJ5wmnod59E78Kxm5U9p75090rU5o5Nx6TR1eHQ7wHDXjtb5DUtk1d/u1aZ+4m3v
 /MIzkiqn3Jfiusz//gU0I9uWa5Gg3AitZDkpaBs4bx1sfLg/9eGmsin/+k95STMitzXF/VyFEaH
 pqiKnq4xX8RLp4u6HMQ==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=69971bb8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kiQjUq8FSzjVjtPiR3oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PV56dK6MMbf9SDzT1_jad5jezYhnFjgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93407-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20F4815F660
X-Rspamd-Action: no action

On 2/19/26 10:39 AM, Abhinaba Rakshit wrote:
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
> 
> To address this, set the ICE clock to TURBO during probe to
> align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
> 
> For platforms where ICE is represented as a separate device,
> use the OPP framework to vote for TURBO mode, maintaining
> proper voltage and power domain constraints.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 1372dc4a4a4d0df982ea3a174df8779a37ce07c6..a60a793f9c230e08ebd7cae89a828980e762db27 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -665,6 +665,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  			dev_info(dev, "ICE OPP table is not registered\n");
>  	}
>  
> +	if (engine->has_opp) {
> +		/* Vote for maximum clock rate for maximum performance */
> +		err = dev_pm_opp_set_rate(dev, INT_MAX);
> +		if (err)
> +			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");

I suppose this isn't exactly critical, but should never happen either

Nonetheless, it's fine

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


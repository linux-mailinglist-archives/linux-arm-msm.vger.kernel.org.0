Return-Path: <linux-arm-msm+bounces-87645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB0CF73D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 09:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7949530E8001
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 08:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE03030BF72;
	Tue,  6 Jan 2026 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRzEvoPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amfuYU/1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCDF309DDB
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686593; cv=none; b=uFl66XynLBoq1SV5WahNsPHA8mFvQpA7jPPNHwblYvlsBUlAmyaLJjjAuwRl83A5rnzK5CptDmVoQ+EY5HbDvGpJZ4bhmrAjTl34KFBa2jOHAfChFxTbdnFwFpKvSIzdRwJTklo505u1MDxVdcvtjoG3zRamykPOvdeIXklThlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686593; c=relaxed/simple;
	bh=f5+U4bIkXAF6HhuAJ3mpf6QbgXiY+y9Yar7nApZbdT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnEfp+Pzl219LZkedNLVPKJboOp0qmT0KbNMXdBB+p2sZDwjE1nawY4GrXjKLhT2tCu/aXdco0hfO9rAVhMqdqU9JksyKdiP62zw4U0W6oeXfsje/E0H851mNtJkoVJqUCCljkXaSxXDArCY0K/Hp3v5+FIQG9LRTLwvtX8WK3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRzEvoPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amfuYU/1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063R0h6529766
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 08:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S3+xtUM3olagLh1tBmNWj8fPCCymvhiEGhTOzn8UdE4=; b=bRzEvoPsKdMbynUm
	lUycbMAVpL4+HrfVeB4OPF/nUQJdsubQB2O0bM3FK93ai7JEUBgeGTeE3KEgJYrP
	rnap/qAjw9X21KuTmiczvmoxBOkY12+HKNOZK0z2SSLLD/Ic7AF1TJweSEBhl4bm
	x5dstuyVD54m8zzPQuRAoNP2P767CxXnYFp1+1IKVicNpa9QWQezere/Vrr06bQp
	HoOQFMmyoJ6vogdg+XjIQxhbp/5Urgj5+hbOTOFJSVil1iFTjosBuaZn8kXQHoaE
	6WLF6ThOIxuLlI6fPEDXMM9CQKDShwm0QxuSAHg2mZedZzlHf+Xdi8+4FIR1IX4g
	+iKk8A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu2aqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 08:03:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f046e16d50so1307013b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 00:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767686590; x=1768291390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3+xtUM3olagLh1tBmNWj8fPCCymvhiEGhTOzn8UdE4=;
        b=amfuYU/1RLaB229lVrkaduss+GUEMjwNBQ5K2C0MdPjX5T4s4QCGWaZatMvK0+LBXl
         Ke0K8T+zxOE4Qf1dMMBsXiqto/Pqw0GOkkH61H235VsGf4VpwNy+g5xq4P8sYUszYtHD
         RU4KVB1nbAb8DSKXKGVtlKvTjBqFURFoyr43YWa0ZcuQUMJXpaQVUi5ZKNNL+GnCZ2NA
         fOyQKLDvYkuvpN+3kL7FtZ/IyJf8UQijkV7vJJfeDsqlmqrWx8C9Js78ImV1a/+BexHd
         pGd1B1vo4sio7ULbMC/hmcqAaGjd6p4kGzgb6BdgZu5zsgia3NlXoI/A5Rx3DBdAdITF
         bSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686590; x=1768291390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3+xtUM3olagLh1tBmNWj8fPCCymvhiEGhTOzn8UdE4=;
        b=FO8V3vRqNCFiPC3pb7ZkFRGhHg7Pu0SXHw4jtx8QZU5SdUIgHwZYrLwGWJ79iFQMUM
         +v2Izdk93RVcg6OtumkGODz0kCHEWLm5KdxoUSuyzBvbDiIukdatUI8ZDnpyCf3Eltcr
         R3Vdrejf9XakewVmZtwRqykm+C7GhDfxVSJGzDDkXvMATeuA0S96h8uWK4fW2EuTDWKo
         2P7w5U5kPEEsDv7oHXeaCUvC7+lb1weSA7ExhPR0mrka3IlQL2rjZPOYwVrXy2ptwLZF
         oW6MHvheknJ2j6iNWzL89hJtS3+5BAegz7P0mJO5nCG84CHjwZ1U1fSr/Gh+tyDmhPe5
         wmlw==
X-Forwarded-Encrypted: i=1; AJvYcCXCPKzbO0q9JhCr8hkBWiUF3WPWZOi+NjajHE1G3WggnfWXj6+hkF6cMH0YacfebvcNfT+nkijBug7imODA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9yH7chVJuhrAZlwNCCC8F2OFdMSrRCRYax+GqYccQTeqarGEc
	p3GVAR3vu7qF68JydCF4RucEvm+YelhzQsHhwuWw0NsYEdwV5cd72ZCq7Qg45U+6k4koTHLl1lI
	dg/ed49xTYd1lzyZT+3EYBBaYQxkIMUP7ISyr36khIlA1FzPyBoIU68nK0onKo1dPMVwx
X-Gm-Gg: AY/fxX7GTFz5AYroFiOI3vieDhWvuUwStJU4k2XV5/vnQSO/4RQRY2jIeOFTP9BGRJ8
	RGMVzklz/2lQyw+5BAr1NV6Ui1/I9wXdYuIrD/b1oczXz7Z05tMEIpNr/Q7rviZNzvM36MhLPpH
	OJccjtt6ji+aTypAf5mBFfeX0r5D2Mi9gqB1Vni11ZWuuh+8puU1uGhmXDwDHTmNgQxvFM8f4v1
	4luZF52HW47KIaiRePWMbwHII2tBMEtX22zo2jWvSDjmmUE/ZmIiaDi/bjhyjVM/6WrS1bGtniY
	gnJtXQ3hZbVxVizS+hzOqtTNGiRafsQiiuuD58jKsEbwHEG+Hl2WVcPS61plfVYl+SaVQ9ED3fR
	lWSUjxal2GawLGr8QRtKfWGUX
X-Received: by 2002:a05:6a00:4c0c:b0:7f7:1857:8456 with SMTP id d2e1a72fcca58-81882bed424mr2160913b3a.55.1767686589581;
        Tue, 06 Jan 2026 00:03:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1StIk5ri+Xdk2XHSuW8HPE18xZLf09BUwEnyMKp00EvRdNGc+dY7FLMF1eltAoyBuNLC6+w==
X-Received: by 2002:a05:6a00:4c0c:b0:7f7:1857:8456 with SMTP id d2e1a72fcca58-81882bed424mr2160864b3a.55.1767686588964;
        Tue, 06 Jan 2026 00:03:08 -0800 (PST)
Received: from work ([120.60.56.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c530133csm1318334b3a.31.2026.01.06.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:03:08 -0800 (PST)
Date: Tue, 6 Jan 2026 13:33:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V3 2/4] dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC
 compatible for x1e80100
Message-ID: <ljaqrxazapkqvv5m5kxm2pq32dmgyupu3fzn7yhgvnvg72o3lm@5qiiuv3oizvh>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260105144643.669344-3-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105144643.669344-3-pradeep.pragallapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2NyBTYWx0ZWRfXxc4p7zA+Msm2
 bLJAZPj+dciwJxVb6Y5nv/722gU6JHaEGS163rqgdncaXdDa1gJqrptgcp8anp5Dmh+GvPvVCRd
 +JdparQU4+W3+kaJC1p6sXrDnMImLXWhXJIKFKujUPyayPxZCtb8kUyPW8NXS05FfAxFY4epBMb
 OUmRsP4mcKcvWDg/wiLtOqT+N31inFFEuAS98BFQdLN9l+Nqy6Up+jcALCf+1Cmjk1Q7RX9JvMA
 io50QvcFKDMs2WojXc2KeVqlMEZQwNHbQAQMXF3T5lUko29241s1027UrxH0ean3quWjVYL+ahN
 KsCSCBF5AfF7WbLvQ9mZ54UrV8vTGCIV/JRiGY3NHV/qU81WIF+53MXRV+ytskKUhd6zv3FHCrU
 fbLz2ei886G1QsQzztVrkOKyaAuRN8YW2DbY86M1vrxWzcr6rweKn5cdDjdjnu04JzpHTCNGVrn
 K9r+cf6ts4lmMu/wc0Q==
X-Proofpoint-ORIG-GUID: TKf55w_1sGCSeBpsSLlooIrtsIJDNIk1
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695cc1be cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JR4DBjdY6jk8CmbmB73bTw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=I8-C11gq8jfHFaFuRmUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: TKf55w_1sGCSeBpsSLlooIrtsIJDNIk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060067

On Mon, Jan 05, 2026 at 08:16:41PM +0530, Pradeep P V K wrote:
> Add UFS Host Controller (UFSHC) compatible for x1e80100 SoC. Use
> SM8550 as a fallback since x1e80100 is fully compatible with it.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  .../bindings/ufs/qcom,sc7180-ufshc.yaml       | 37 +++++++++++--------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> index d94ef4e6b85a..c1085d178421 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> @@ -31,21 +31,28 @@ select:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - qcom,msm8998-ufshc
> -          - qcom,qcs8300-ufshc
> -          - qcom,sa8775p-ufshc
> -          - qcom,sc7180-ufshc
> -          - qcom,sc7280-ufshc
> -          - qcom,sc8180x-ufshc
> -          - qcom,sc8280xp-ufshc
> -          - qcom,sm8250-ufshc
> -          - qcom,sm8350-ufshc
> -          - qcom,sm8450-ufshc
> -          - qcom,sm8550-ufshc
> -      - const: qcom,ufshc
> -      - const: jedec,ufs-2.0
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,x1e80100-ufshc
> +          - const: qcom,sm8550-ufshc
> +          - const: qcom,ufshc
> +          - const: jedec,ufs-2.0
> +      - items:
> +          - enum:
> +              - qcom,msm8998-ufshc
> +              - qcom,qcs8300-ufshc
> +              - qcom,sa8775p-ufshc
> +              - qcom,sc7180-ufshc
> +              - qcom,sc7280-ufshc
> +              - qcom,sc8180x-ufshc
> +              - qcom,sc8280xp-ufshc
> +              - qcom,sm8250-ufshc
> +              - qcom,sm8350-ufshc
> +              - qcom,sm8450-ufshc
> +              - qcom,sm8550-ufshc
> +          - const: qcom,ufshc
> +          - const: jedec,ufs-2.0
>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


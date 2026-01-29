Return-Path: <linux-arm-msm+bounces-91096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHqAKkKtemmv9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:43:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC5AA53A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35C0730247D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FC425B1DA;
	Thu, 29 Jan 2026 00:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3GZ+HWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpfEFMKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC7A2472A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647415; cv=none; b=Kky3LMYMZA7Lg69GdORLUHkQYrxb+TKL8V3ncTgm6m8qCyWFcdKIkdVYfUpS0vd9O9Xor+iakf1ZYWYcNcd/HBOHpde1Sc5n8LGTvdlVdbfq0/IyZgW7lsGJZZM+ZuCQMPCzfj5C8bS9HJLo1vQUAE4+iQG1ODSXQymVSEDsoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647415; c=relaxed/simple;
	bh=NzMQri6zt8xUTjE2FymoITkNiCbu2IOthjmRupTpRMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNn3hCj2pCN22tXlP8lNxv4o32eDdxndRAC7etBr3Wg+d7vn/AwV2ERwBOrAOyBcJ0lonfYOqcCi538E7mbHx08LUZQ6shRYNs6f+rlIBqxEXvIqQETrQDEHU9+LqpdgMG/O3YG8b1xMntn3N7wz7oti6rFr1u4gggeilRa14YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3GZ+HWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpfEFMKM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SLpUok1399054
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bX7afXRfCQDK+en7SrtIzGAhO6+OT/6JRMev9l6gCus=; b=V3GZ+HWL9HvvHACU
	f8YG/kPegfK2prEbz3GJFSSp3SlwoDEQFSqeaGoQHc7UcDn3DKqt8V6mafQzlqba
	tbVV3Sym/SqT+9S8UiPNqPTkiUHJcMQ4QmycEtXxljACxcdzAZPHTME045hwPoSb
	xyZSd8MTGkK2+bo4g/TPgsUdS7e+uB6WknDMobJZ8IdTUh1DyJQ8LfHt7tUbTT+i
	6P9x0Udv53ywCFJFAVGeWeLjk0Mn2Hj7ZpgvikIjnfBRZyR950lmP+eRR0eE+S/p
	qJdCfp8+yNN/LJWkNXVPThwWMLodS+U12627OUHLYHrfnt5LlGuMXA9lrt0Lxa9f
	cakQTA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy0cvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:43:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5f52b01cdc7so512606137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647411; x=1770252211; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bX7afXRfCQDK+en7SrtIzGAhO6+OT/6JRMev9l6gCus=;
        b=EpfEFMKMmYhomALUqcFjUp2VfmzxtGKFloOslDIBYCbZZrnG8ma2JXe2sMVVQGIHvs
         YdetfsEOmRzYIgmEXOKA15+npEUVItzkWtY4cCrq6qcIONGvGpvvX4+A3OqsdZ0PPClz
         liWfGPpMFwshlEJRUgk2fo4aXM6c0lnSovPDERkqxGMwAtLN9TDSXfqT13So61u7QWQh
         l5JkJzxjEvqiwmrhcPeCoov5K7S5P51i7ZuPQHviQzpyHTqphybH35yOQrSYffMGs+dz
         DccY0nc4LWquzlHb+O0j9xL/1gPFBTKzZrYn4Rpz1oXaFWR5xuaQdvELK9/VcHgch53l
         ICJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647411; x=1770252211;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bX7afXRfCQDK+en7SrtIzGAhO6+OT/6JRMev9l6gCus=;
        b=Jz6pz7h5Ah4O8AJDVcVUw9FdHNar2griFo7fgZA+1JP77ACVa3BFxlKhEXbJQqDCdj
         7mDna3byJ0K3STOzgOvqyjjJa4ojK0KktR7klt1HbUCPxG6HQCIkSt/Py8DWl3Dv2ygw
         DkYuHkS8IQGnoY5Ig40J1fPLvYFzN7xk/VtVSQWE6mZSUd+LfUIg7ra4NtN7eOqF2/Lf
         N1NvmZqTCBexOe+XKl1MYMvktKxO02eJjUYI6onsw1j/HVQ8kJxiVdixxpengsD46/qt
         SUZr7lB6oFMpFWgNGLU5jwmEigPem9AA8wKATF/RgUUm+ogPAnKYRxtVJ4UUcC/Y2xNR
         apYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS7aiUXCE4Qm8eE3D6I1lK7lP57nQ1hpzhObnqKyPou5tgy8xkAVm1+pBUpzk4SHTVAGaprPaGr6xz+tsk@vger.kernel.org
X-Gm-Message-State: AOJu0YzXkJ/AyPqNJZoYsA6b5QrdiKFXKZsVBZJFuoLqJvcZdA11PHSL
	OfB8W0W/LnWeCFomt14FE4qFCyzurpzXienKN5C1q5vA+hU7rkbij0GlwCUhH2HMTkhKZK6tB9v
	ENGhsdhmXzeUFPS7W5HmKmIuXxaQ0nyalT4Hj+rXRhohPXGnZclZO77xU//xlE0q6nDRe
X-Gm-Gg: AZuq6aLeEAyOTE7PwgWI6OTO3pFA2Xh7AUnqvkU/JCJv9UXUhpILOmqFda7RD4pMrC4
	Pg4sAmp6pz99A4b57zr4R2iEvyKutKO0QcvPLHKz5C2bQ52HalJfDu2mpGyPncPqJpaU9Yn8Nte
	JQ8q+QCz8QJ2pE4j25O1sbJfEHa+MCCd/RX8ESigjf4gJDuQY6U76xY0BaAe1HwI9asGJYdB82y
	LxvC5m6EZwrz1UsmbiKR/3h7Vo8U//meHH+2+ggPtlZ5lJ22dywzwYxOsHd5PvuVAsLL2IzMFWm
	WWAVC7IpA6FP8EIosT6U5fypGxoKz09qG0WqD3EhN9ZP5lTpfxsDP86MbQyd+CsJjqSvkIRqnzU
	R+AQg6AzjpnD3h1hMFIwQ/sNMauYSeY76myOsVJvBQbXK8bTDiv0JWX3loXpCob/GB2/tpo/MIH
	bYV++cnhUpnLKikWMhsfUGJXc=
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr2063515137.39.1769647411533;
        Wed, 28 Jan 2026 16:43:31 -0800 (PST)
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr2063500137.39.1769647411132;
        Wed, 28 Jan 2026 16:43:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074819b5sm832104e87.14.2026.01.28.16.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:43:28 -0800 (PST)
Date: Thu, 29 Jan 2026 02:43:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: lemans: Enable CDSP cooling
Message-ID: <o3gdovqbkmclpmrhjtg3lknhqcecwfrp73bpbv6nsspzvkjfm7@qqkrzte3cdy5>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-6-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127155722.2797783-6-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMyBTYWx0ZWRfXzIvHLyNDrHDU
 ePIKHpV1+QwBAEGcCIQ6VbTWctztf2vZ1iKID+33fqvfcvOWiBMmTUjxgm58Ad3lJNaxKuLW+Fn
 ezfll+YJ/oRkgLdJBDHxlFbQm5guPVX7Ca8HgmeEnicZvPD/bhcBmHRAGusDfPsNV3wx5TZrKVR
 i/+hTttRCa4CoQC0xlnzcDoKoywp3zgoFmMm2S49Nd4m+6XdIlIjssympcIaAkW3DlvrNxzx+Hx
 ZwdFqKmh1W+5Jgk8g1HR1yH8utx3PBSOFz+953FuicZy5LBZKD0X7Q5y1Mgz+2HomRwFJtZsbnf
 oNlgrpnCD1kCY0COB63QFm79+m8W9OX65tZ7geSxaGP28BTnUcl3Zszh6Ltkxl5kZWxC7/27u1K
 dhAwXRgHczhRet6GyBwj7XFCHti2hbPKBxT5NnmXz9cFMWjOMJ3j7xZklTIYiKWddQifwx1i6Jf
 2m1SvHU7Gk2ffwiixtw==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697aad34 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TbTdv1u1e-S373k040MA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: I9zcwuamdSQifxc8Rvq6TVlMXE9sBpQW
X-Proofpoint-GUID: I9zcwuamdSQifxc8Rvq6TVlMXE9sBpQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91096-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.11:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57FC5AA53A
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:27:19PM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in Lemans.
> 
> Set up CDSP cooling by throttling the cdsp when it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 138 ++++++++++++++++++++++++---
>  1 file changed, 126 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 808827b83553..c747dd534caa 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -7281,6 +7281,15 @@ compute-cb@11 {
>  					};
>  				};
>  			};
> +
> +			cooling {
> +				compatible = "qcom,qmi-cooling-cdsp";
> +
> +				cdsp_tmd0: cdsp-tmd0 {

This question was already raised. Are there more than one cooling device
for the DSP? If not, drop the subnodes.

> +					label = "cdsp_sw";
> +					#cooling-cells = <2>;
> +				};
> +			};
>  		};
>  
>  		nspb_noc: interconnect@2a0c0000 {

-- 
With best wishes
Dmitry


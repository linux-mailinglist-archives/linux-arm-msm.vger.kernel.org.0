Return-Path: <linux-arm-msm+bounces-85468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC09CC7351
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22DBB30054AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8C835F8AA;
	Wed, 17 Dec 2025 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGXHAJ4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpm5EIM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143B535E55C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966576; cv=none; b=lmxlzI6T3kgwXK7QaZe9tzKDda/s4Df6ypPYvHp8hd7laNlEl3+oBimyFHA3MHMHZ6elOGLhMVclxGCT0oWoc9UzE7nOmkoXEV9LM5lxXXZzQxfRrmGjB75Qg9YyIxmESD2/pJMvwYimTyR8Y7AG2ucYRf0WbwABqGYNouJm3cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966576; c=relaxed/simple;
	bh=mH8nn9jjAfvWECfRjZaqUGZyvvJ0DKbDcSf4oOO1t94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQZSDVJslVI31QmUVqJFcvXN50p9xHThgu/Eqa5r0MqOsaLi+W3ncif/yhMXdGZN21OrtqYeNEgKSjbpFL+dXO34HMUIDjBhnmWjaGnqVzp9uH2r/jGSAQdatE+P0xvP/nNxLmvenvjEcFBH0ZsZG9EtuGtxePbmDFIe/OxWWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGXHAJ4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpm5EIM7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3wtDF1904439
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l/xZDnUeUO35b3I3C5M4BMwZ
	n2jSVlNaPM2ESIW56t4=; b=QGXHAJ4zmJfmr31JVYuN8ZEdUH5TD53Qx9hl6phf
	3UnD2jRX/I7QPZUcCu7y+UYCc+Gwr1+8aZJ91omayjDVpDMZLgcRIIq+x/8HktQ7
	gvIUEibdjxSzpXYrH/HXkec2e4M/Yu4aNCXc4wyEh+Ifm4wgUigVY/Mu3vsubQPd
	YoANU/ucqydFTBiwQ77iKeVbG961Eah9Lh/QHmvg0Dk4b5RD1pegATAXijEeBzDh
	M4JR1FUgvW+Rh89wfMgLN3lXeADNhpDa8Zw+vzmnCk9y6Wm8ZuwSRW9eNTrtWApU
	aPCdO509beOikV+XoiD/3Cvtsy6FVbL2acR78MBajuwwsQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n331658-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:16:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34a9bb41009so8799087a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765966573; x=1766571373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/xZDnUeUO35b3I3C5M4BMwZn2jSVlNaPM2ESIW56t4=;
        b=fpm5EIM7pzSZ4iUdxvVNJX/X16/BxgisCVal91x+mD+R+/6ODAT+/kQktQ8f5fRoOx
         P0GO918M+2s51UEaQ0xaetKpjTjrKD2nmvMfmMYBAMyEL+JOBsudAiSh8obgzbgV/Fqc
         Ww12/Gb4+EUipsGDE2Q9iD5vLUP1gXxUU1b3Zc++xyNjM64kAlfKWbRvfo4UUEvzVATA
         12CpMHwrsmgfkJL5vXuZ+21gkYMzktgiJK8YqcA+wPSTpcd2GdG30ThqXgz5F8J7CI5W
         Monx04iWP/BnBlaSLY1zMgwudWPGbNTeJTnPQtoa1DlW/SDjJk3l8RXSq5HO/ETPBN/o
         NHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966573; x=1766571373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/xZDnUeUO35b3I3C5M4BMwZn2jSVlNaPM2ESIW56t4=;
        b=PiG9VWWu3LnWcxaSsVC/PGND00eTCOz6YUg5TcycdFl17UNKns2PT+MvUlUQn0MOXR
         dIb1o2pSzbM0/fJs3uCKhKpY+fd2SNqfplKj1AD4De4nrh69tRMtoHOx6DWn9WkvZSF/
         1B+OWBmlXCO2zZ3ogt21RXcOQLQqYSvSJEqGQnrhwAa4v0w6LDoi9CWHys65oEKm9sXf
         EDq1mIr9h51/8FJgCiNHx/2yBbXJPAaFWVkUSTibtbv9QBMFpjrRctb5cw0vxifsqATK
         EDVsBD8w7OZQQiBDn9Acz9uvpNW1ZzZLeIAEOx3njXKyyOeuWwF+NnqzQcOBo50K6L53
         fNFw==
X-Forwarded-Encrypted: i=1; AJvYcCX1h5ayJlmykcFTxcu4RjiiPmlpSIeisER2ZLcOIwJV9h+p1ldbpkNZOEIHhH9wmGWl4wZhhR2+t+QmkhRD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4DwiiN95DYD25+qWkYLKAUvLeAPsjrwabQ4NVupND0IXLyATH
	/nkqIi2CWsgX9QsBuymcRosChH7qTiMKRRimEuSYkj6DeU5epPz8hb61ycpP+hgxWIW36hrpACc
	DAO5XSYTnMMXRVW4oiIQitV1wcXPO0tvMfcXFxHFIXu2sMPmNBaPeKccV4UdkalLj9aJv
X-Gm-Gg: AY/fxX7rFQKMGGt3Ijnml7flBDtYx1BrPI90qljfCcNj4TNgoRt49oxDbyPu57ep6jx
	DZAFV16zRL/7JSi/qrU2HlsO5i417HgVfm3T7YDadRMasey/Yj9Bqyt0HDM0XLMrgfI2JN+FFT2
	gsZyGTe35DmEnMiYVayQzaG2x1STWdcRivFYUaJtEGAWSaxAHv52ZTv39LsxCeHI2y8Xf/hcWBi
	ZqWVSJIL4rNQIKMUSF0VeI4HglPsJ0JIObk6CPtFUHV+NdEeVMQr2oS2xHBuJ8dbPEGvc4AA0xJ
	ViyNs1WX1dFTEjCfxd1iwiwNmgSwc7nlGLNTuNjTN6CbzLHHe6pGkyXv9nO95wPVGQMYmRmfnRE
	NmmFx627u/LnuIULV3dChdgCQijxNzmNPuBldCniOzTRiIiHZ/lj3u3RrmoPeEkTpGcdUaCJKyj
	GcvGpNekERuYKmzFvN2hOpiynEz7TQcObnZQzsux4=
X-Received: by 2002:a05:6a21:6d96:b0:340:e2dc:95ae with SMTP id adf61e73a8af0-369afa081c2mr17186919637.42.1765966572863;
        Wed, 17 Dec 2025 02:16:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG28gYFW6jNzdH4o3+cp1m/WrdWI4UPCJQ4X5h2LS2EVukJ3JufUALexn+c50+Um2VFcin/4w==
X-Received: by 2002:a05:6a21:6d96:b0:340:e2dc:95ae with SMTP id adf61e73a8af0-369afa081c2mr17186887637.42.1765966572360;
        Wed, 17 Dec 2025 02:16:12 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2599228dsm18247772a12.1.2025.12.17.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:16:11 -0800 (PST)
Date: Wed, 17 Dec 2025 15:46:04 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v7 0/8] Add new driver for WCSS secure PIL loading
Message-ID: <aUKC5EuWRzsyrHnz@hu-varada-blr.qualcomm.com>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MiBTYWx0ZWRfXywdf67PCtGan
 pJlNSFNddhSPCmtvk9///ivs3G8OIpQB7jwP1GvsTcEIQN80LIhv2gaeU8flE5EeruOEBFNf5uI
 KmjsKTvJd25mLyEbHniMYoKQ8w6sCMx24zdef2K7xzGdWUsh0oRLrLyNXR4lVObxJyv/11Dgazy
 U4nWxaoKOyx9cKMjunOfsv1j8ehKPYdpvn5JkUWl+jlO7iBPl5OdRs4TQtm3WRJnRir+Tc7n9y6
 np5cbBIuw6wSKAZJtNPwNaCqjxAjFYr1e1BrLPjMxgStjiGcViXcPH+53Ys+nkqcbHITnxrPDBO
 8pOUpm0X3CSNWDV08f1+Und40e1SAhXGtCWNrcukNja1zJb492bT99bS296oGvIZhGBHgZ/cldN
 Me0OMSGbA8kKTB6tf4aJPnuUT4J0fA==
X-Proofpoint-GUID: i8eyIYWAVNkH2u4cBqq8iGcapgNHx5Fn
X-Proofpoint-ORIG-GUID: i8eyIYWAVNkH2u4cBqq8iGcapgNHx5Fn
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=694282ed cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8
 a=EUspDBNiAAAA:8 a=TL2kJGixJNIIMCu0d0IA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170082

Dmitry/George,

> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> I've resumed Gokul's work as the last submission dates back April 2025.

Thanks for following up on this.

> This series depends on Sricharan's tmel-qmp mailbox driver series v4 [1].

Since Sricharan's tmel-qmp driver is stuck, this patch series will not
get merged. Shall I drop the ipq5424 related patches and portions of
code in the driver and post a new version so that other SoCs are
unblocked. Please let me know.

Thanks
Varada

> - Secure PIL is signed, split firmware images which only TrustZone (TZ)
>   can authenticate and load. Linux kernel will send a request to TZ to
>   authenticate and load the PIL images.
>
> - When secure PIL support was added to the existing wcss PIL driver
>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>   This series adds a new secure PIL driver for the same.
>
> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>   reposted from [3].
>
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
>
> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
>
> [3]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

[ . . . ]


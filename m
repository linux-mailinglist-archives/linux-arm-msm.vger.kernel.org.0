Return-Path: <linux-arm-msm+bounces-85240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49ACBDF01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 14:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEA25303E48D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB7429BD87;
	Mon, 15 Dec 2025 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvUtMtyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/CONo3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB0299A90
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802180; cv=none; b=mXHegoEedJQerzR6aUEWx1JSkanabqrR25Y0LQydG9hkSyc4/yapI8DzzUjclJKP2wkpRj/Lr17vhfwVLuJYHdMrZzLbTudWkySwITJ61xlr4/r743pCX/VzK5M/mLr4IOPlj2Y7qUn7A5eBI/fHxlsmy3kEFirnX/dZPrcFca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802180; c=relaxed/simple;
	bh=yA1XqBdQY/l3cKpAxxLkvw+QusVrjputVquC1aGUb0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikQ6LOlCc6wLtP7jVwBVGAIoczCEWTvNyvTR8BMr9wm16Vkuab3n4C1wVk9bX3r8vYeETFr5Cn9CxABTKgJxKQAUzpZNhXIf0HnOENBrIQeBAMP+tfMDhBEAgqKCW2LTw4/dQx+Sbw7vn/DBc6J6f1n+Y68xdxkLvXJZh8vo5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvUtMtyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/CONo3Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANrrW984994
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FxMSxKWmIQqSkiT0adHaZN+j
	fSlVfyD72OviIhDO0UY=; b=SvUtMtyz8JW1NPmrfHLsWhrFOfk1g+QwZZ/HOB3B
	eKG8vtw2j4+YtiuOzNzy3x0I7NBvbfMGD9y41ygPQ+JbUcUXju/B2fUE1L5N6kPb
	FQjdh0KLBBet1MNH2WXTbUGsiwoot2lqq1W3rBVFSbFGaizUGbNwfBm8A/QGy/6j
	Mw9M0dwWVmg30HJEmF0l5yTW3d20F9SVvFqLfV+LSmX0V3cUp0F86P4hT4jia5b+
	6XLjMKR6lFU0ezDo6JU+KNv6rQ4SnIqsTKpccCbHlcJAsuxtqCOPVhmdt6+tQeRf
	S4EOARmFyKll6kZ1AA0sUfpOqjrlbn3ztA84jQY2X58CZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7vgsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:36:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b286006ffaso907328685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765802177; x=1766406977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxMSxKWmIQqSkiT0adHaZN+jfSlVfyD72OviIhDO0UY=;
        b=H/CONo3Y5Wzj2pz4ohwa+hewgPYWxi4cECKIEUKlNrKG+cvmjfXVzMl57GBGPnITUY
         r9ii6xNCmq6eX34eJ1ZJa1tb2uO3dDZAJEmWJieDPjS27flat5fGrBjgR/trL8ChCkcT
         5iQSR4/P7zchr+UZyCzYFXIBCvxjEJkuXIcDXKs36AtF18gZSOdNtb7BMToWGKyCBcAj
         vzKsDHoWTunqOtTAbtv568SqK93V/sPqw9OPM5JiaBNtYzwnbEtd9aNDQzjYgakruPd4
         NPpr/SfnUXOcC76toGohksCcDK70jcAqGzbZFZ8S4F5w2hMwqTz1jH1Sx2FZccGdqJba
         /S3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765802177; x=1766406977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxMSxKWmIQqSkiT0adHaZN+jfSlVfyD72OviIhDO0UY=;
        b=SZTd2S47Q6VFoQTHGgBoTC9fCg/i1+1GqrVqBVi/vdDzigMGGwhY8kHImufJyNdDTW
         Wbzuv0RLjUye3IZkBSR/GFb9T1uiyHKorNK0Sskc656hVagDCbMrBVok4M4p2u+0b8Nb
         aeb1+9yojbcl4YfM9mVjLj0hn+MvZ/LsXTGJO+n/dQ3ulboeXpSsUOAizh5dpvv2wwAS
         wNDKXE/2AF0rZWXFybeVgNM03wg6d/e//Yb7Z19MsCG3lvr4coDzeM+Mcdeo8bzTLxqS
         RPIbUiZTGhPZMnVtYr3Gx9UOtBFj2jbh34nD3UE/9GVvl+JUkgvj8DXwSj29GDtwJEeD
         5pWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyzsfofx+P5EYXpoa/7p6dSPFNY2ZfALvH18am8bgUpUhlAqx/HMcTzA8LrjRu/p+c4Qr7+Sbpz3vw9ZTH@vger.kernel.org
X-Gm-Message-State: AOJu0YziU/xfKPbt/WjvnuhhtCfI42WcJmRCAZwlALnr0opKMJclXQCc
	oDcU+kLJw2Mt4zsDZtludSKg5URpj1UrVtB8jJgS+w3BacioTMKA/48hhBGx4KJLxcR05I3dDBl
	1YsTYxQbqqKKSVf2mjyq1hX/HnA1uAPqoXVUG7dWTvFaGOd1NUvrjtDPAey0y3Gwv1YIR
X-Gm-Gg: AY/fxX43UXo7GpXrpecl6UTohbByuQcMwueLjpqpNK+GCBVshIbPcHeND04Wzo/JxJX
	Wpwi8JdnsdndfJ8g5zN4F3vU35FJ2DRI1KiyJFz3tMKGbfDBW+XttIyjhehhOQyTlwbdDN+qKCS
	kSM8cAQ+amkjI3vOINspqnaopOnNMI1hUYsndUDJCpa+Qe9bdMVBCm2WwuyOxtMo/S8VMxhLqAC
	uKAGCHBmI7J3xcmMbG38UhN3po85FtDxu95p47AEEows1BpoTQ2p9YCkUfxwW7K43obEqkSYGZX
	mWjjuQAInl+H7jiK1ARdo6AwDFVgY2wt+hr4AFG+dXtBrxznShhadEi9BRSSfpDF5a9xto5MGp9
	ho/yBUp06sXNNxSyLha9qwA==
X-Received: by 2002:a05:622a:14cd:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f1d05d0ca2mr135743191cf.56.1765802176539;
        Mon, 15 Dec 2025 04:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUMQHfbZ4VwPbph3sBUvkMnjui9TESiMXvuk4g2I93L2wpzSiT/pk3iuMNmhsBZxio2zTOMg==
X-Received: by 2002:a05:622a:14cd:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f1d05d0ca2mr135742721cf.56.1765802175890;
        Mon, 15 Dec 2025 04:36:15 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43009dfe55asm16747238f8f.41.2025.12.15.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:36:15 -0800 (PST)
Date: Mon, 15 Dec 2025 14:36:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: kaanapali: Add base QRD board
Message-ID: <4p3huithuex4mwsjxtoynolxnymqbwj3wp5lw2yeet2zin5jgu@4qqlleqnvqwq>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-5-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-knp-dts-v4-5-1541bebeb89f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwOSBTYWx0ZWRfX+jfxj5Gl1E+1
 373f/kHskn3mggO2t1xz5ctpm6U2P8riyz3Dct7a1cjQOZm+f5qqcvtjZlHbx0HJHqbTw5k7MNm
 Jxb5Z+byQRmM3N8+lNgF7RiK4hHA8FtzK1jyypFCVg2Noc6PcuqG8Oio7Hk48d48oyOb7HVIvox
 SQAKIWrfni/UBoRFqYyr0ap4wUZs0ClmkYkaAaSgdYHyDA8qQ68n/I/UgoZzvmr5n+NPdJtJJ2z
 WyJQ7pEkFCZ4MbFO+5EtB91oijxFKIIL9TlegOX0h5cNKr2ZnSeuikeAh3e/+Euqwe700EBJ5yw
 QBvz1H9hXahqRs+MHfj6CGzcD/ONer6liTbSDJBQfGdI/9zN4prjJBAMwLZHNWPpxZ1E4HKg4Q1
 MiyXXKAqlpdBWYUS/gEeSmqTYXNxcA==
X-Proofpoint-ORIG-GUID: rrrbPLOak_QGQnvabn1BoTdgjUd7RS5-
X-Proofpoint-GUID: rrrbPLOak_QGQnvabn1BoTdgjUd7RS5-
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694000c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ii0bGMNOlrnFhgTP-T8A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150109

On 25-12-15 01:07:25, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali QRD board which enables
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added ufs) and Manish Pandey (added SD Card).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


Return-Path: <linux-arm-msm+bounces-74482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58522B939FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 01:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02B7D2E0F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 23:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E157F2E7F39;
	Mon, 22 Sep 2025 23:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaG2ts2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAA82641F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758584532; cv=none; b=RyeOfCkKAOKnNMkuOuXIaa5CJ0ptXbu2/nzWQupebKnVvXejnD9+YOjbc92CPWe80QEkUmEjIdCSl+U7yWY7bZ2jCq7wGR/0/e+FMF0p4HsA5lvr+T1mCM7HnzEJFQ9sTatd90E8jB4/FceahIa7TQEpsSJPWMMKbMbgd4XQUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758584532; c=relaxed/simple;
	bh=oHyZaDiA8R4Y9wEbW/1scOyFjbmpQglImEmfOhiImt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heUkGD8tcLabvUdJBXPBNZlwYOs9aqH3oAAR2j7ZlHf8bhhnzUyakbsynR6fl1ZoXez/gpUQxFsXlP4S/fdRch6JWm+yBX/vLdM1AmTyF/rAIcCfnId70sx0rZj9l7ui/iwWo5OiQZ/njeR+oZNblQhK/0QDsNrq04n+Qkau+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaG2ts2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MIBM39029389
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wKrPMr0tlkE4G5cOmGjs48vk
	F6z+umGdX9J0UdLXMTk=; b=IaG2ts2/uJmj19op1DGaZGmEckol3fdc4E/ER5pR
	vBstcL5JTs4W4h0uMkjkSvRQPyVO8QbQisnPCxaJrL9y0uINT6aP7mHU7DzDDmB/
	Cdq2F5yOIiFgwxpQpWmid0qmHHtnMhTOW329znjbj7ChL2ot93+bRfk+1eYceDIL
	IkGZrEs3q84fuQB+rSaFLBg2q+4z0ZGqyCMVRJ95yHnrwotb9VU8iv+xmR/vM6+V
	+7QstFJG+L3kNz6j/M0pn4O62H32CPFQH02ITOsApKHBzdbOKewJgw73Sb+6Iu9Q
	2FEImUNeLnkjPyk5gVgMZsQ/097EUFpZVDfoIvgwhRpMRA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk2ckc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:42:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-79538b281cdso77804006d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 16:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758584529; x=1759189329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKrPMr0tlkE4G5cOmGjs48vkF6z+umGdX9J0UdLXMTk=;
        b=hq1OBPlvRR49O7LI25awHAVrN02VfJG2gMGd/8pvAzl9JkCrQnuGPP0VYokK01LgQ3
         ivdYXfYyPvP45ee5Y7pX7DtNGE6RUNMXxriKJx/NcfQCLzb1PImZ9hTp6+wl1qy6LmmE
         3O9ne0m7w9yF5Eh81IaChYYk5YbrBMkExlLJD1MhWugqFX1Sz1XgwVXbt/suRl7yloJl
         09jIWTnjUX5XQ7OPN0SGkHbWYyJQrFwgSXzAaJCb3Y5FRDzHaMa/wPbqL1Cp/oVC3ETI
         B2ciPOOoy189c0TLvb9KMMzxOAvjpa4+XTgvYpDTHmTiK0quDt4h3H1TAmS19do6BS3U
         as6g==
X-Forwarded-Encrypted: i=1; AJvYcCUad1iELl/G5k+gWjKA28hx4d5+p/W29op7V7thMMhTIgGu1fq6/Jbh82sbS+O6eTepelyVmH37AJoWw4Tk@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxKcQyzfNcDbOTb0w5rDcoNuusudKTpg4BDaEgHu00Gf94vta
	cGECQLor5lQqNLaUBaMaAugmQo97fjJRrnG7ELnJq6f8QKvF8b8H1w/FiC0x+pmN0Te1L71Y5sE
	Y+4pZwMBOnkwvTavyJ4WE/6YeKnz/FmZlwXRUJ388mBU8GR3OCYyuKqoIupbrVxqFsmCnU0nw6P
	Nx
X-Gm-Gg: ASbGncvQTk1gopTVaB7WfSFAC7vK9NHjVdx6EtzP0gpWce/tZ8tflTHgDcY1Jy1clfi
	ADcrdGnYEO0IYxesFyNUg+M6+nrzRfjjexY9EMTj1YthRIiD5CEUgz87KmXLHbJsC5Y3UBualcI
	Tpm1ox2fd891jPq+OcsDZ1Hb100WsbIDxEeCvHNPt6mqYqMcw1rnf7Shk0Od2xb+U4cZ8S5jlNS
	N1zWAtkXkQPuqASZ4bUVXV1hANTToRpqPwbcSPqBtThpbEesoiJLPxZ5CgfxiYd64ASbeao69b2
	8XLOHu7ZY1klqVlQ6NCBLMK5GTDIafpKZ1gk1SbaFn/Tppbe7ZEqdJWWn7/cnn/3KNteVcZdjwq
	wUqPujtj3eEp/JW3/BY2G9AxAK1e5ujxnObtJNMtN3cCvM+NjtAtt
X-Received: by 2002:a05:6214:258c:b0:78e:5985:92f1 with SMTP id 6a1803df08f44-7e7a3c99478mr7170386d6.11.1758584529338;
        Mon, 22 Sep 2025 16:42:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBTLWQ1yvXxw7dPCeN1omOgmdIcvJix3NNKAQEDZUCozU8Xb/ljY+ZqfX5B8NkKKsPbkx9aw==
X-Received: by 2002:a05:6214:258c:b0:78e:5985:92f1 with SMTP id 6a1803df08f44-7e7a3c99478mr7170146d6.11.1758584528898;
        Mon, 22 Sep 2025 16:42:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f45387sm3686349e87.1.2025.09.22.16.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 16:42:08 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:42:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-combo: Use regulator_bulk_data with
 init_load_uA for regulator setup
Message-ID: <zqj6ojdg5qizvhdec7ubedb7i4ftoth2o7p5ydbu6euszxbzh5@atc4z46iewxo>
References: <20250922135901.2067-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922135901.2067-1-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: xjqDy4wN4Z-rhxVurRBfG_jHUWqBlJnV
X-Proofpoint-ORIG-GUID: xjqDy4wN4Z-rhxVurRBfG_jHUWqBlJnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX0uj4F9WXTMIW
 todbIhLcdIzryHeNQPYIRdfL9+ymgq9vx0xjFaJDKnDEG4WTSA5a53Mh7d4Iw6zW+bAahWFDqvK
 jG1y8DkMnPZHFrXcPK3i4FdB2roOjMojW6TFcWEXxU+pSslfO/wB5t6Sehj9gmo3ZWLzVqqfTJ7
 JFjxeQrr8kUOkRvS3sDWXwF9Xob5CvwVQPpceb/w8KMJs/vuggpPsYZNyjrT1aTUoNRv9ObgUws
 WSVZkVx5XXbP/9ZrfWJDXJb5EIKO5q7C6UhVNIGdl+l2dtciu2E/ZaGpjCU4rinHdEcGozraTTk
 w2B0ITuFejrY5vq05pwVNarC9KZjNd1zAMRLZhoRSSKLVbLXCxkXYqKqMUf/CjTkMNsVs76GUmh
 m8imAhKM
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d1ded2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tZu8JuLyvjuD0Hmwe5kA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On Mon, Sep 22, 2025 at 07:29:01PM +0530, Faisal Hassan wrote:
> Replace the custom qmp_regulator_data structure with the standard
> regulator_bulk_data and use the init_load_uA field to set regulator
> load during initialization.
> 
> This change simplifies the regulator setup by removing manual
> allocation and load configuration logic, and leverages
> devm_regulator_bulk_get_const() to automatically apply load settings
> before enabling regulators.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 49 +++--------------------
>  1 file changed, 6 insertions(+), 43 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


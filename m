Return-Path: <linux-arm-msm+bounces-87123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74ACEC3C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF6E30281BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6304B27FD76;
	Wed, 31 Dec 2025 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKiaatVk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ip9Yb46t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35BE3A1E82
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198059; cv=none; b=YY83OUAVtLBJRAAdF3lFo8Emtg6GhiDnWULu0yWmqOoMMcyLcGrKMxrJBSpcjrgtENZZgJKNlDizfg91uOV0kV9/dDzQbZY+WIG1MO6Jk3fH2vN4xoTTOJ0C6o8Uz55Wn5HSS6nnSvbgRgQ7/6FLM641uZJfZeReT09hiv8iBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198059; c=relaxed/simple;
	bh=UVAg56rkM+auEpEP194lxDA2RuqsebNQ02WdwnZoJ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbh4X7P+FCGDgkkCe1fMAF34/SL57rV30A9CdD+oEPITURgiuJQ7XVqPjEgEBaKJFWVOuuxgdJaR/Iz5hkkXSI6aONEnCyd1gUvjGpMvxt+Z+Oxoa49Zn3rwn9Hh9dLHBmPqg3ztZ9+FXyPKX6dWA7hbycPjbBc+FB4oMVho7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKiaatVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ip9Yb46t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV6Qh4s900395
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 16:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GCtRj0kGJkzqJqbBi+nzUzz3
	hAt/gdZ19OL7R78+TBg=; b=PKiaatVkwcqrWuY8DFvYqxHgFWBTdDtGeebn3+7m
	dTlCiYdpxYrotSGQN3J3EzH5e4Uqi5vyxAys7qOVn9+vYGNtfeuZWRQNZ15gdRyC
	XTYw5OCExmIoWrDa/699sbcu0o5P0SPvJyCEqg5BbIwNqxv3LlhZRKKIPWd+nR37
	7J4nR3ki4eRZIcJbFk987EGPu0o2/dG4/payno8QEF0lgpMwVdGmKIO2sZEtQrdv
	YEfIoIMWUvGxiRfY85cSRrW7NpwXdctXoeNYplYYNxT08Fn9sJNzsGYJ+pFUfd9n
	kIVFKkeXGsE0T78aGjFK/FvIAeyea8c6iS1YkcUoTMa89Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3ubn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 16:20:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so326488161cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767198056; x=1767802856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCtRj0kGJkzqJqbBi+nzUzz3hAt/gdZ19OL7R78+TBg=;
        b=ip9Yb46tNwxqLwPJfbw2Gge3YEzE2jQ3n6YSrYTt+FDsjDgrGHGZulKdGlLulGeCCG
         rx9QLnB4qv2tMEjUeDPIYbG5QFjnjeIryW08J+ti8e7ZjHjZLa3FEhhBUjCWAON40Sm3
         yV7sWFGzmxqWxxhgNI81a15iMrlNMiAqFbiBXfcreip52JVQQYhv16Rm7CJ4vSVgWu35
         I1n+OvtMZUxI8hDK3jIVXBnF6RO43CPGSaRsYpCiNIPMCveRaP1aigQBy+suFz12mK2d
         aYKd4VFlaz2f+0xpM4gGxouaWlJs843uQ0NhndiRdgvhFJGxusJHn4QzzdGjZffO9+PJ
         8YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198056; x=1767802856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCtRj0kGJkzqJqbBi+nzUzz3hAt/gdZ19OL7R78+TBg=;
        b=t7PA3xdIaZylureSsn586An/Inq9ZO35q1mrc0GOzIArwTBmKYpDf9X3YJ65gdQiHO
         47uWPRVDfWY5NrnNB8XAY5HnrSh6Deoc/93Ck5O5txnpjFC27qupe+HNEtzoMPicBx30
         gqX4uoF05mYXH6eWhoYDXDLCPKdOUGiZpHOJRjoyCehunnA46Yjct7mvI0lkcqjCfZTO
         mW17HITr19XZ529Z5iaHvAIAH376OQR/cDjVtgzP8uNssovNWOvOY1TQMzurc9i+xYR8
         xjeXIv/8fxPtBleGRzb1wcMuiqXirbvhSw6xJPjDcimOzpoBn8/Xg1AjySyzqJoRGUte
         1VQA==
X-Forwarded-Encrypted: i=1; AJvYcCXelSa/NxOwYawL+ZtSJ6LhMmiNe9wd6SYtJu5ilyjP1+NJLLO9WKaAYn69+CGBWxqKFIaKrUMUbjcQ3WwD@vger.kernel.org
X-Gm-Message-State: AOJu0YxTdADLlO1LcFbZWzDIWFvl4qIkiuSGHLfIjcT8E+nvVA256ooR
	rVLc2zYPcBCItuLPdo6hyjM8uQ9mhnV/ddS+WA5gIk+6SttWYMOO9zouYqeZDLkydUwbcjO8Bov
	PoqD8ied3XsL0E3Mjq34SlfxUgAa0KttSiX08W6zJhh0PTDBJ01NjPhbGJ43b+I9gYcxW
X-Gm-Gg: AY/fxX5GdZX8XgJKSTS1gAGp1NbA/StVGa5ywTgh1jDHi5OcBVhJjCEkvBNpX1rElf+
	dOysb5Je7CHaj+G/B/1mXKQUouVPsfTUXI5T6e5eEkpY9gn1b50rFdOPI+heudzxxyNWzMQJfN7
	YLqkUX6CPgMz38xnEFBdtb3rtY3zlsRxrH4Xta+wExeFY3xvK4thnZYCPVBVdVTGZgcSpM0LTa2
	KP4WMI4VT/P7My54v7X14gyb+lf5kv2zvTFVwDOcBeDTUb6l2VLzYugW8j1DWxqn/hYoMZW7P4m
	5guWr/1JxJLX1h7aOdoCl2oZnx3+4TDozJJG36cDiM1cX90/J49vXkyQ4i/2PPMs/E3pTLbqqm1
	R/rkbm520n0Z2WfW5ljuu8FddFPvZfsPUra/kHjCVyZEHSwEMcQ24uvVZQNwdBgWhD2V8Z5AlGN
	MqHrTz4O+6Nx8jaUrC2/loP7A=
X-Received: by 2002:a05:622a:4c15:b0:4f3:59a7:67b3 with SMTP id d75a77b69052e-4f4abcf0be2mr535753511cf.20.1767198056184;
        Wed, 31 Dec 2025 08:20:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV93a2/ytBr0yG7s3l17noCqyNn3HiIII00axJsk7y5AoZm/pGqNYSP6VR1gOdPsz+SL1V2A==
X-Received: by 2002:a05:622a:4c15:b0:4f3:59a7:67b3 with SMTP id d75a77b69052e-4f4abcf0be2mr535752671cf.20.1767198054918;
        Wed, 31 Dec 2025 08:20:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282ecsm11179301e87.94.2025.12.31.08.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 08:20:54 -0800 (PST)
Date: Wed, 31 Dec 2025 18:20:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 12/14] arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT
 properly
Message-ID: <fk75wduux3dilfx32mlufx7alz7cbz2xa3s5ubdpyosd2t74yh@7x7q7yhogmne>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-12-1ff4d6028ad5@oss.qualcomm.com>
 <ed3e9128-cf11-4ba7-a7f5-cac2c537c2e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed3e9128-cf11-4ba7-a7f5-cac2c537c2e3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE0MyBTYWx0ZWRfX2y/VW3hRqHkC
 9dXiE53rJlUDyZ3HPEjA2nCVuGlJTmTmcJfsk6gBoxXOdTTwLXLEENpKWq7nO/xHL4i3LyAg4Dz
 h3WhiiGSZNgjX3ExWndGUF0eoG/rhmI+neSFAqSBNWPKrnLB0ZcaWNtCRlDhNm7oDbYttG1BYkC
 qvJPuYSx6U3VrfpihJBKPMWaWOqFsEivMVlpTlMMTGbOM6Mk0virxqQp9zTXAib1TPGvecF7TWq
 K9jJ7s3FDw1PcCnGeeIEu4h30j743DcCu3c1cAZmdSbHVpZ/hC1JVXuW4kBVFGqqPpXb0mT/yRq
 /n4LDpJVuaRJdBCH0LDCxyy6/Zw3ewuZI09npHW+YfedX/tjDacs1mDQwJ1on4lL2u0qtNTHTHb
 tMcuz9XpCWqMnr/PejMtpVALz5X3sAxRLwFJPiXagLtVTT87k5WtFzAYK9roRNxdbMKknqNF/2d
 RIhsk7KErk+BkNriUuA==
X-Proofpoint-ORIG-GUID: QQzVHYlQ7NQDjnz-S5MPaVgoc2IWg_Zp
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=69554d69 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YM-ir784Kfn1-1I9OqQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: QQzVHYlQ7NQDjnz-S5MPaVgoc2IWg_Zp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310143

On Wed, Dec 31, 2025 at 01:19:23PM +0100, Konrad Dybcio wrote:
> On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> > The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> > further spreads generated voltage. Describe the PMU in the device tree.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&pm660_gpios {
> > +	sw_ctrl_default: sw-ctrl-default-state {
> > +		pins = "gpio5";
> > +		function = "normal";
> > +
> > +		input-enable;
> > +		bias-pull-down;
> 
> Ideally
> 
> func
> (no \n)
> bias-pull-down
> input-enable

I'll try remembering this for the next iteration.

> 
> anyway:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry


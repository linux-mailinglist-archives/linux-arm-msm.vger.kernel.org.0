Return-Path: <linux-arm-msm+bounces-84976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5ACB4BC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17B7130146CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 05:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2E5289374;
	Thu, 11 Dec 2025 05:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6vLDzGe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvScKcOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7616F288
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430199; cv=none; b=KaFZMFrTjkz3fKig+Wrsid6HysDASbi2W/fPiihYjS9JahtmmwmrCbj8U9x6SpdxwLv1frb6LWnbNtKrcrhu+qpoAcHD7glGZxlySp4dbbiMWIQNcUvrmI/V3iIawekS7w/KtDm7sUbxHGvG0FkgjIzZbhfvODunLjvDiUn/QGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430199; c=relaxed/simple;
	bh=RSMy5KgESJbvLSPLrzgpFHOuVXXnqHZI8OL36ABoOyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggiy/D9GjJ4DxK3hTZ1zR5iSeMXXRDdoUh0+OkNe/PmBq9kHvlHWs4wKxbKb+afhpy4GDSD/bcllxZT8YZL6ZSAojVru4bjdsYA6sGiXO9jGMAkBo6lX8rG6ZWDB+YYVWaoX9IUAGgSVYwOkvVCf7gciTGD5RHbRqeQDp9StfT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6vLDzGe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvScKcOH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPMEo3735712
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iC64GZYTP0ExJ/XDQw8it7Ll
	jnTS1uU1C1vmg7w7aMQ=; b=R6vLDzGeKJ7fuWfq8iCqBLPrnPm02FCx8DIeztJl
	fxi5NIka3u5/QMWlND9UN6VpNk3+Gx9WRas+jzgUVKAcT1ZT1JskD3tUwFa0jxKk
	3jonYrXiiao47L2lgkvFKWZEiaztAj71+vFoD7nWTqCytqQPUENntUupCDCsT+r6
	9P9m5zUelzE4+NLFOUHo/a6HX1L+NAgxSRoGl35FZm7Fcq56hbfUIwAIuvQAyeLe
	xrm6lOc+BGF0XNVZ+2WwKrFvDySHnOyX9pyeA9FmbojhYCxnCDp0HfXjhtDFxQQ/
	DIJlny440F54yiPMM3EHYc7wvuZTOziXmmW/ujok8FrAxg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0ps6hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:16:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so14066111cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 21:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765430194; x=1766034994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iC64GZYTP0ExJ/XDQw8it7LljnTS1uU1C1vmg7w7aMQ=;
        b=cvScKcOHdEVb+cv//IvRxkppVFk0LSAt9XkRd5h6ksp6c7ZIP8KpPFDvSiND9tDjD3
         8uL0RxClOffMM4W21IPfKZnfOLxUDVYdBInD+X1Gkus2yzKXKYZib5S8hBfQLcsSI/O/
         Wd7U0l3cj+X7AsbIWQvdp5uO/dOmEqlocmM5bRzoBD7+5yMAxiWeid6GrcLgmyY4NU0y
         gqXoZ/sYxqYnAWsVHB/NuTaJaWryG1zwrcOwWlyuZZLeKGKcA3cj1wWWov88rHG/Kwxb
         czaQKJY8ZNSpTYaOeyp4rtpdZGtwV/5YzqtLx5gUUg1C6j2HBpSrIyEVFVJSCLzyfFrE
         7PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765430194; x=1766034994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iC64GZYTP0ExJ/XDQw8it7LljnTS1uU1C1vmg7w7aMQ=;
        b=qXPr+XMy0zgX9uhpxua/IYv8WmF6lhSIstcgx+ETjQY3qpvDU860C7OjZSbtM4zkfA
         8y8OenCEV7OfPbh0Z+NXRzCPBO0sc0o4Blu/GS5I5iWACNC4XspuldWDnfZtwHhbMxcn
         blmrL3IkPE8ejyvM6iDvZXka2+jZSTNr4qbRYHE+zfqIVQMhiBHr+vXZG71i7OPrQnow
         /8Qit5ZMkAWidPFJZfzn6beQGcM6xbEsi0KQiwRfWCLgprwvl0ftBdVql6WA74rEX7fv
         yK8Eq7p/Ks4ysck5RTGimvjeL+o4ULd3RXGiyrslBCRmMVwanEeYd+DEmv5cyRwDVaZb
         0MCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7VR1rMpYzYhIl3UgDPgYyCmZuZu9QbOVYv9h5yoxDx9eW4hSuMgGaDOmiUdgqTTVCPlxgKep0M1waEIhh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2eoHVW6AgN81VM42c0jrJ2tnBLnrD+x4+YhxXfKcBhJ3xF/No
	vNHuY6wnyzGIGWR5GXZXqsyYmXQrWUzB/Nl0B/44jG8gpUQd+1lvaZuFrEKsVJ92OaG5LzwG/t/
	wnBTkvYAbg162ABgJkQifLhnKvtCP+OBEqGkR1I4K/9J3Cc5S4mBcIWwGbKhBjrCe3h9k
X-Gm-Gg: AY/fxX5Za6cHDm6pFtxsRtvaWrRW6zFPnnj8v+tPLFmiuJn72DiQ0VRa0iY2q1gIJ1C
	KD/veh6/+TbMTbGrBbP83Vni/Xg2nDxn7qt+IKQEwVxcI+CVyrDvqrktHy1rzxgDo3tSIM3INy3
	JE9dO63UxpinlTtULsyE+gPk1+1A7YPKCVzenmN0mnxMcgQ8f4qNxIE1M/dbOkq9johtfBPvmb8
	OO5BdZ2N9Xc88c/B99fcicR5Qg4v+xhXTmx4OlKbcUxkWUZVkykX4VYphmBfLfyltJzP0WgsqvM
	m3XTpWwolX2JTom8laGZDV73TQ5UIi1XZ7wMotwhHgVNr+pRXxSDvoQjHnE/CuEpr8Jy6QjK4uZ
	hFcu3zmqweXhNwoK3wLqHWS8lXk6aBazrMz9iZ0Lx0HEYp6pJrjF14F8KpAcOb+VbybVjjD8dlT
	7hadcjGovqTu9gwU6nY8TbVDo=
X-Received: by 2002:a05:622a:1e19:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f1b19b88c5mr54294051cf.10.1765430194538;
        Wed, 10 Dec 2025 21:16:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwd9oLeFDljFaCQeRHzACMAkn+4FkG8O1G7wq3ItraCp5oly9VXU3f4nhxQ9Ma4hvYTao8VA==
X-Received: by 2002:a05:622a:1e19:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f1b19b88c5mr54293851cf.10.1765430194070;
        Wed, 10 Dec 2025 21:16:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199e93sm522084e87.96.2025.12.10.21.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:16:33 -0800 (PST)
Date: Thu, 11 Dec 2025 07:16:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Robert Mader <robert.mader@collabora.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211014846.16602-6-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: nozGQRzce9Y62KJj_qYqEcXD39pjsrkk
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a53b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8 a=He3dl_zFzQSlanp4l3sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAzNSBTYWx0ZWRfX1VV/+1rSyoSL
 77/n0L7hhCer6zKdB36KVwdQPepBJTnhfZjAZIo++4Tqp3ROVC5WJDuUMn907HehAbmg0uJIExZ
 y+MRNyNq2iDcucmkUT6awpUHUzDyk/yVESJccfy0GMSN4nyPU55H8eKYIDX60qcKRohfBJeEjsy
 3Xdqw8XD4B/1F1NJv3VvYtsuid5uL7rX4IOY220eLD1WlNI1zCQ/R9zuW9Ym7zJuD/Rj0F+ueYo
 t17tN2yWWPBHIyZUYA53TEX6Ed5OkDQSb7SNaFY3FKkomo3MKJVNYynfXUS9k2yXH80dKMGY4JO
 ryHh3hIIzNonm/pb1Jz5HckslHT1ZeYLKjArAHKdmdIvC6qxBeuHjOb4ODUOs1d8weyNiMfcFe7
 N5J/jMLcfiYvshFdNd7l+iAQ/0+QDA==
X-Proofpoint-GUID: nozGQRzce9Y62KJj_qYqEcXD39pjsrkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110035

On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> @@ -392,6 +420,64 @@ vreg_bob: bob {
>  	};
>  };
>  
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_1p225>;
> +	vdda-pll-supply = <&vreg_s6a_0p87>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			camss_endpoint1: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&cam_front_endpoint>;
> +			};
> +		};
> +	};

This would be much better:

  &camss_endpoint1: {
      clock-lanes, data-lanes, remote-endpoint here
  };


> +};

-- 
With best wishes
Dmitry


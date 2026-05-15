Return-Path: <linux-arm-msm+bounces-107783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP+hD4X5BmpoqAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:46:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9017A54DA22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2DB631D1BE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00683CFF65;
	Fri, 15 May 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XG6uQAbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHOasTWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E93CF952
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840776; cv=none; b=VSBvAS7aaHQsekL86ppMnZY1GYS2cOE6eWLUe22kfFS0H0+6EjeJJDz8fsxehsW/HhuQ1hezi3U5zpfBzstgUYJGQVYepi7/pm+vAmvhIoqc/YgJMZi0WnY8xX7TeH9XZtWNxWYDjWkO3ZXnbPOYoKMvYOqYki/xdd5nfkVjA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840776; c=relaxed/simple;
	bh=QFtzC7b/1f6NP3+QfIo5lhUSru9B+PbuhuuSV9Omoys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mU1rBAdzFUEyTa6AdQlTWnp+CSa9UzJ4UNUKbOBEBurPqOBxqfkdjo2UDpHzVswSHmtNzmM4uJhbVuq+6FpA4glpNK2TOR1fm59/n25TtevJQldbQLooscC0E0nyOjjSjQOIJxaBU1PWfKb0Oa74lN9SxNi+ijc7VnOTg7oapHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XG6uQAbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHOasTWn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4w16M3670819
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vk7VBeUZzwHE3tZsc8Y1s7QJ
	tuqy7pziC/VqL2N4MPg=; b=XG6uQAbTVNoUkjFp6sKqxJxlFxx5Ias4ao5X2tNQ
	VEX/vAcUJvsaYeHaKQhPfyowDr6ITxsGlrs7AAhM4bRsuWZcDNh9ATdyGphdsw7v
	5SbXFzoU6oUHVQLcIFMd3X4GbLE6/TcbTAV1IIzJEQVEGOF95o1PiZQcr/W/kSBx
	V6xuOnxQln5n/lgrzUSW29XRkWWuQ9o6wRTFuVttpk1kVZwu/nThqcJlhKGkqHM8
	qDQQO+Bkh20Dsm+wUVQN3lAbwP/RopWb44zq8roDoPCEDwJlVkQX2MkZPp5zQ91c
	mAXuc4O1kqla2PmuMfIUGNJQfhQYi5LsyzqnsUu8U2oT7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2vyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:26:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0edeb6so20121151cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840774; x=1779445574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vk7VBeUZzwHE3tZsc8Y1s7QJtuqy7pziC/VqL2N4MPg=;
        b=gHOasTWnKHH7HEb7pQKzECT/GJCxZwxXKxVsm9bedCKpgZqI3p9Bfl3RJ1lytJkJlI
         v/NJdbrX9q+11h7Q5K5QBKpH20n3OgIyIseZqfF5DNvi82fYcYy3qTTIrsVxc3xNvIWL
         BM3dEZe6RVBqs2zOaXqbHotVCyu1oJzNsu+X1K6IFn6RP1DlteXuXbRNsgzBH7VcdiyT
         bYSLYDoAUhVM22XNuTcGShamZH8JDt57oYQyN/mk+oxKTIrm6af5WJmrhX5RE/kXSwQO
         3UaVwbr36i8XxuHpCeWkL4MwxeQffjd8wdAaDMz/VhsgWmXhTrfSabVuMWvPi2hsYmRJ
         LfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840774; x=1779445574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk7VBeUZzwHE3tZsc8Y1s7QJtuqy7pziC/VqL2N4MPg=;
        b=peArIYM65daq15i3hhTfZFQ1xfrNvetDag4jQzBCGFFrG9Mohc4j9GfEckZJFTM76v
         d+8XHLH7wlqXpH7Jak73d7gb9Hn70iZimwe8kirUluZTN7/87gHc3Hw55je7JAVACvyr
         Css927MbWgkeptzAHomnOH1i9rjLMCD1b3+95x4nYGUxRoyuHijJ5/v2/GyVvgFP63G5
         OQlLvYa8cmBLNzR2Pwn0T6Xjtp3cozFsmGAs8cCtMpfPKZQqlcA6/R4tGQKTAP+FoePT
         CCEoyZtmaKtLijdQl/ndMJL4/z6uh0e3BwloAnGi8Z7JVxg+EEy35dworMYIhEWqnZSo
         z+7w==
X-Forwarded-Encrypted: i=1; AFNElJ85oappjxiSujk8HyOYquL+yfM8nw8BZQhIZsdlxDp3iLiz/33oX75EyJhJcdPp2dGCkw06U51S8a7V2/OI@vger.kernel.org
X-Gm-Message-State: AOJu0YySEbWN1+I8kRGTjDefW/emO/vA/2X1PMsci+hQczXEH7lNnDZ+
	vqLPFXSIsSO8O9wuofYUba4LKZo8+G5trytZNHzL8A3bQWAYAg80f3QZffGB+LdDxrvHmTrz51+
	3g8YWldGTxsVXEWdHduBalF7lHrKXlPf0I5mzN9+JiCeb81PRdYxWHARsp/cASY+fVFN/
X-Gm-Gg: Acq92OHFYqFvUmnB/jRtAam6Bys1Ir2D+rLteUsni+0xt3VN3Nkrb4Eh8FOx9XAChQi
	LXdN9UIyeUBohkgXzXsVfkTyi89wEJwO3lW3FkDrC1mmdzbom2NKX8htDzvbCrV5bhS8t6h1gnl
	60/CQuE+Ia/kU3ykKVAEmxiFqfSt+RdKznVtWjYUOZIVcWQ9Re3IoufXacX9Lro8H6IbmlwAIQa
	lzaw0zaJs6KsdLGp21kDoCujzDTVsPu5Xs+ORBAbzwAUHWVN1/oE76nPY3DiZCbeykIgDaiWwC4
	SrK2tnnpvcgwK1lPHZZoa3Bxmnh7FH6gQR73GhhMDmYqKarp0TNkEeitXYrN6ygSH2t4ayl0/gI
	7c4dpfQ/YnjW/QfdAcjkZIKeeBfyk6PE2cx0XUtfUEFQ3tFN1fCLFbI2xtZYMya73RcZp7GQCt1
	fjfkBpDTdf9/SHVWnqyd0MGUZp1fyciol9BnE=
X-Received: by 2002:ac8:5e4e:0:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-516419629f0mr95751491cf.40.1778840773585;
        Fri, 15 May 2026 03:26:13 -0700 (PDT)
X-Received: by 2002:ac8:5e4e:0:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-516419629f0mr95751181cf.40.1778840773127;
        Fri, 15 May 2026 03:26:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8dc7afsm14595861fa.14.2026.05.15.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:26:12 -0700 (PDT)
Date: Fri, 15 May 2026 13:26:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add reg and clocks for
 QoS configuration
Message-ID: <r3r37hdua62lpt4xiahuhun5hgz6gtirmvwqo2ze5qaluw4kzo@7ikdv6kj3wxt>
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNSBTYWx0ZWRfX0+zuWmuaa4Q/
 dcCadpDRCf5N655se77z5ILJPymO/7DXpzAub2cAWqU6FE1jN0keuoTc3nv4eD/olPBKryJcRT2
 eDTeNub/sRFqPxqDLjJ4cMqV3pebqON11wzqDrW8jnHpl5CFQHavCs13TR92hk/MpUQzHt7VZE1
 Ih0UbRDaQECI1jtYzjQe/4capkJrdedoPHLJ1PVPqB7KglcGtlKpylz+RbeOSbS89i13VXrM1Aa
 onKbMnGHlT0f+Ovk0tIVHEim0zmjb6PEUEGLoF5Omt67jmTQ8j5jkQqu6FU433vNjX+y15B3fx5
 Y4DJpqA/XAj4dblFikIdPx4Q8l0RV8yGiq111HZ6p5mb4EQTiHsG6jNlfvYFN0ptSli7FxtCvvJ
 rYyAmWeJo5n8aRliA3C8Dv4XIkS/wfMf0PlzjLw63RP/TYB3I4vMXLRzFDnQcRa9alIz7NIZmfr
 SUPoSV0LgKaG3esG/VA==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06f4c6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=7vROA1eCcShV3ZceFmgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: gL0ySqbhBjuVceuCklLVQs6037HOwhZX
X-Proofpoint-ORIG-GUID: gL0ySqbhBjuVceuCklLVQs6037HOwhZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150105
X-Rspamd-Queue-Id: 9017A54DA22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107783-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 10:25:14PM +0800, Xilin Wu wrote:
> Add register ranges for the SC8280XP interconnect providers so the driver
> can program the NoC QoS registers.
> 
> Move the real NoC providers under soc@0, keep clk_virt and mc_virt as
> virtual top-level providers, and add the clocks required for QoS
> programming on aggre1_noc and aggre2_noc.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 157 ++++++++++++++++++++-------------
>  1 file changed, 97 insertions(+), 60 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


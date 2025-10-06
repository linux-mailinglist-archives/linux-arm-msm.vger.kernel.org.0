Return-Path: <linux-arm-msm+bounces-76035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1512BBDA30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5912418965F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB278221FD0;
	Mon,  6 Oct 2025 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvzBBO7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC122172C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745559; cv=none; b=JYccBBPnUPyfobFbDocPH1bPWdCtM6jlj85JxzMdiASkBJZoiDhSPyJoWb26BopNhBPDWYmyuCKC2H7b9NFWzZGDvxqVPbI5dIQx8DSAwEsVkF+YB5NxxXKzlLTMinwGS/GNTGpSunycAOadruDF3T/JEltZZQgjhWs1jigfL9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745559; c=relaxed/simple;
	bh=yC8qDztRmXd2wzVFIUgYhjND7TqP1DFur68MAZODzUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwYssTpa7PodIBj9sPd3K8xdYDN2NkUqoiK5NipDRK/Tm6s+xzRKCLmpOg/waSFw2C1XJBFbP4K4GZqaayOHnLO5TPqWyqGVpPBKz1Wr8z1WrZmRMSlB5V8GxHpAMUwK8GdFIVO6kiGBgDnysaEEJNubXqJ9siG5kcuIzRXM7Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvzBBO7T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960M8VE015546
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9DjbUCmcg5sdBYa+VdHMlxmG
	F69VZ4TGKs8z0vOln+c=; b=LvzBBO7Tq6twkF4N9J/m+/YuUV4rwSzLlYC/Ifla
	9RZ4gWdS6Kg+7bQar5P2YZmvUZgOzJE82hLZi0lVm5i6oM76F2LamB+hvpcgazMp
	E5GA1m/kZEVrdKXlQC1naEH7QLGgNCvvmfkMthYsMh9wVmdm5IKB0KMuqCq44HcM
	FJctnQqcBCbrgCTjD77fd5C3SctiSipcXD2jly3UBsea0OpYS/0RAkJ0TqgVDk/9
	iYEY/eZFWZfXtOiTp1de9j7E/TOtlc53XbdadMLJ6S8iP8VlLfIiYrpDKeD3zduT
	ZbXovSucBY2cWrjowhyY5g96rXsgFSJyVwlmJSSj9Ra4rQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu3jyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:12:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df7cdf22cbso144644371cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745556; x=1760350356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DjbUCmcg5sdBYa+VdHMlxmGF69VZ4TGKs8z0vOln+c=;
        b=maxQZ5xFTvJCtkIHBCaEYVqvHLhW+Ym+JBwXB2wbeUohxfcdxG0/u+nWQF2H65p5zV
         B6z0DlvHFwgUciivzLmTf6NYVUwsgumietfNVptps36Rmyo+6RQP8c8/aen8GhHBQL2k
         N6f6K8oOIL7qBRAHFkGc6OKsJ+vmaZf8cTqvFWOpuL6q0CnHyE3TZIsNUkoiVldaMgFz
         Ob00ryFd2lCzFDQcq7G7VLvmrVVAbfU++04iSZBGP/QThlegQxbE8LkqTtRL8ETUfl+z
         1yIHdyAE6piXevSpJXIWdTlRTkdKSMRxOYy/YglO/4bNTd64RuijwQkNThhP0XPsZLJT
         dMxw==
X-Gm-Message-State: AOJu0YwOqHP+pgGhPnLFXF+2KIuQuKzNcMLjNROyMFlYEnzC1sEU/Gpt
	jP6hpBqX0yvJYDeQSQTnwVEs+qsBFHMG3ZnWOovG3C0mMahpKlVBg4jRGFrvzLjeFXgtcGNDqV8
	BoureBAE3llszD2OgZPfBAFoYr3lvYRyo/M6hRzL5kme/YXu915421uJjQDuC8mNRoCGu
X-Gm-Gg: ASbGncuonAEt9MFNln9Pkmcc5dZiLNDbk73yxomWda+JRn4XlQCKbUTSkmIWlm+shqP
	CFz3q3LADO4T4nA5h9MYkK+cv431JrAHEc2J77UBDDPgvHnFNI+Kt75kuPwxEDyxO0yF9Px3pkl
	C1BIFPk6QD/D0VKC9CMpmLyxhW1FyDhrF0qCRC+tT9cX3Ah56H2/F4Tk9NfJr7JKojvQIgg3TzQ
	VEc0wkURP2yru/mPi03EL04t3yBvtD4ueca+NT94Qm99w+iilQ5DlLAn7qeTzYcOj9hZbUII6G5
	YFRoc1wKXXfaexPFLDMxyHu1T1KdhngiNY1yQVwya7+J1C31L9u9PQwJOQDd5DAyx6rqONakNco
	lWDji9IK0lTq1WgMKszAhclu+IpNWJ6See5rd0vQzWm/fyVdLM+pZEV9B4w==
X-Received: by 2002:a05:622a:130e:b0:4b5:d6db:eea1 with SMTP id d75a77b69052e-4e563c5da0fmr209850651cf.39.1759745556315;
        Mon, 06 Oct 2025 03:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVYsEsv3GQHoe9XDvDjqIIC4TE7FK2OBx7RMlbBeqiTU7xwK2kdO72i5DVh/m7khG5Kv9KDw==
X-Received: by 2002:a05:622a:130e:b0:4b5:d6db:eea1 with SMTP id d75a77b69052e-4e563c5da0fmr209850151cf.39.1759745555626;
        Mon, 06 Oct 2025 03:12:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba44441dsm42561471fa.37.2025.10.06.03.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:12:34 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:12:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 4/7] drm/msm/dsi: add DSI PHY configuration on QCS8300
Message-ID: <knlsejrmxfzgb7qdy5hpiawuxfg6b5hltjpweope2hl3dm6liy@y5yop35p5afe>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-5-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-5-quic_amakhija@quicinc.com>
X-Proofpoint-ORIG-GUID: w7mhKEPBV6shk2zXptypKQ4Wv2Hr6gNJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX2PsqAWm6eN2W
 r5UweTD/Hmw1EGeQu+eWC78rhawmWyKueODa2IlWZqnJeAsumOFpYFswcAgwvUdtUvFWpAPicTt
 /XNPQCYelz1T2xFjCLk4siXcwB27V8ErP2EfcdLdUVLCzQ5CNvAGKyKLDolSumFtCzl1usYjnzx
 mwD4zKUdmF+ioJ7H0TTh5IkljrLWsOVFg2cqAGUKrSJ2c01qh9xlolReggBhxCxxyVxoWPVo1B6
 VVq7D05O+vuW/lV9banREO1fjE+0npMASZOHMSg+Oe9S5TsJg/T4IWTCfOEMLgVLAAZ2YnPGelN
 44d6j0YlozqoVgj6xVcIw2ovCcRy6M3kEGE5Kj+YUr/46sSVpOryTb+Av7v7L//PRMqjCjGaqr9
 EL3T6eQsVGdoioeQeqUBmQtGaYBf9g==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e39615 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=tMqVXGxUZ0RuQ0S_Ei8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: w7mhKEPBV6shk2zXptypKQ4Wv2Hr6gNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On Mon, Oct 06, 2025 at 07:09:21AM +0530, Ayushi Makhija wrote:
> The QCS8300 SoC uses the 5nm (v4.2) DSI PHY driver.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

The whole point of having the compat fallbacks is to remove the need to
modify the driver. Please review how platform bus handles binding to OF
devices.

-- 
With best wishes
Dmitry


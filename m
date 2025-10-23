Return-Path: <linux-arm-msm+bounces-78578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6EDC00DAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 666EB4E655B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B3030E0E7;
	Thu, 23 Oct 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG/7kiHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BD530DEB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219977; cv=none; b=kdczd/h9Wi4329fPsveW6GLvB5mv3q9E9RLRF877YwOFYzL0FvMYok2qr2mbCqnbnvKH+Tc7O5OncMdn/Zi5Ka0jonrSwLwKHQhAHVIbi52S2SuBLpa+uDVuiWqw141MSrt8tcL9I5TTdG1zsdzPyJLe0n8MpWf3u9vmZ5ufAsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219977; c=relaxed/simple;
	bh=wktu7qOGetTfmxCdZDCA++hXkuBC8rTbnXyIqghi7Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkYYMwUrnVR0UXTjHFXzenamaR0Xdi9vqkQKfZG3LL0Vybb0IMHj/f+iJtuzj9enK9SKduCpWBhp2UC2MsgE0Rp8kdomqvUHhRZiI4OFQiNDle1IAFWf0Gqvis4WUG+ZDrICie7LZT6lqDBcrhr5YmtsQGoN/nn49jfDLWX1S08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AG/7kiHs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8T7vR027485
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxuIotyBL55oBcMXr+JxN4AV
	8Gzau+khOnLw0uMLwiE=; b=AG/7kiHs7N6pOQg3k2714gtxaacwe+b11V+Qxw0I
	Gu3nGXyQXnnl2wcGdF4vMjXMe/9qh3BGYvdzCS0MsPOsKxCTt/wzX9Rq1tl2xrbU
	73PCUnFsHIskxPhes8UiAHznc8EZcKfCyUud6Wvtk9iD71ex9VJMS/PMvMgfMZMh
	nHr3826/BOjI8mxOxiIhGQJZKLIdayhTdzbGifxonGp2Ot/2dcR6VAqaQ5CPKyKx
	7OOdihE1qqqXk2t2Rtmgx0354pQ2uieNY437lT1DP0qdHgHr12jP8xDC1IfgsH+9
	fRlKxhSQ6lyIuk8OotssUFYlf49PYcTYFgoQbXxDp03SwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524aefg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:46:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e892f776d0so36413361cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219974; x=1761824774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxuIotyBL55oBcMXr+JxN4AV8Gzau+khOnLw0uMLwiE=;
        b=K3tQIjXVHRbqdwLCyJTlsXabAT2KUMyZ+1nbjkc+jkGFocl4Fg50SLGbKvyAjoHs9R
         oTqvswgDs/XnJBsK6HRxP2N8K3xoXVZioYRRjElBldqWBR6aGCeEy3iwBUdSkXvr9F4/
         ryOcXIg5d8cm/gypDbg4SBPe7g3Yixkm5hnh/M/ns2mugvaZ0G0kOHqjuOBe8DjcRQZk
         e7ggdLLYVMrVelNp4uhkfInscTggoZBw+nYroAUunEVwxMzIJ41qhML/17q0LCIGthPG
         HQmDU1dThl8XjvauEKYI1kl2SJKvG32FlS1zS9QoPTTp6brMPb/RYgVQi3XdjEN5IBh0
         4AqA==
X-Forwarded-Encrypted: i=1; AJvYcCWRR5/XQH+/3dPc1kLkYkMELoRBMg4UWKsb3pmfhgBwkcudF1vg5FGgEGbpo1K8sw6Q21Jsi0GpENE4GACD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk7Rqso927Vc3DJeIfwzdQMabdw3NS2fxn0xNO8lLFXcGppBkk
	4Ub+JBZeYCFPnDVP1xhrDwpCU9ZdlZ6J9ZWrTP+Zwz2LiB0zbg3u7b/qntC6sWdxtQGayFHIlfm
	BS1Q1LczHjS7Yekg8qfvYXxBZGS316/h1Qg18nTNX7qVj4HfPoSJw0kfRtcaKTP2GjM05
X-Gm-Gg: ASbGncsajjm3Nw9m762mL9cpvhtUcREqYKTXhBzORhkjTtzhHenVeY3xgyg0yjYEDsW
	jhwV2EMy7UnB9OfXrMb/t/KVs0AUEK6vLP/x7NVkZb5QAzDlGip/s8LSinNHMpXsRUGdB8KBYof
	YLIIQWHaGV/UfTpdZR3mAGlNV+xMA2TuAsvEjAGEA7+96rZOjeyOgkOV7N/pTFRw/x3WWR5Ip24
	rn3XyT/zBA+gb5fQ6QbFdc9mE9/Kozd/jsYiW2Rc2KcBXu6HqS6Ko8NluhTQUvv7QB9JF6/IffM
	F2VHiBMvTC6w5ubmXINUqhJevxz9MrdCiTfhCO4zWjD4wQpDY7Txu+LE/FI4cbkHUugWH830J64
	BP3KwzICEVf76PZv5mNQ94C0slOu0fM+bmw8ndc23Hh3yDYlk1nmpDvhOJ3lxpa2Byed3DnohfG
	ZXSsOiVgItXwGM
X-Received: by 2002:a05:622a:1a21:b0:4e8:ac66:ee44 with SMTP id d75a77b69052e-4e8ac66f4a4mr250238291cf.39.1761219974229;
        Thu, 23 Oct 2025 04:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8+pCnO8ZvR8ffZYHTiXBpe8PitkiTaa+bMCiZZSPHl7XKSC3gu/++FOyxZx7Quca27fB8MQ==
X-Received: by 2002:a05:622a:1a21:b0:4e8:ac66:ee44 with SMTP id d75a77b69052e-4e8ac66f4a4mr250237771cf.39.1761219973768;
        Thu, 23 Oct 2025 04:46:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d39b96sm656447e87.110.2025.10.23.04.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:46:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 00/12] drm/msm: Add support for Kaanapali
Message-ID: <r6kjuxajnimaqazeimzc5gscv2qxudjzkyooxumzakjzojibbl@2jiw6duxfbtz>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX9Hj0iZU84V+u
 XcgltT5kL+fVp2CrW65fuPkPNEDUAZtERV+7GeRtgoYRpy/XcVaHTohGFXpjqyRsW0vDdrO7KKA
 6A5V96wONKXTIYYK+o28shH4/Ber/OA4Cuw01fHPqb5u705Zrka2BdFfTHsfXvqtxv5ql7zUmss
 ky9meE1aX74Gw1+uqz6RrWvpJsBLyI6NmR+wsiBdBe8a479D8AfVcati4kQwxd9YFV1JDsdciZt
 wOjyhpMD/k2nN0mFf4dZXw/lc/71dlu/QCPOPkJZleGqk3D1bdovrXFCkfdgoWMxiaBU1UL0plR
 3tlnvfp2LR0lP9x+yRDBasTcrZO8khPz4bQJKtN4++TCIMkclvQP2h5xKh9oTNkx1epx8Z18XmP
 013vQTxkUzKUTTE2Z+Ve0NS87PHiWA==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa1587 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=PFSzt4Q9d-Ge22CFuaAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: PDifF17UPvbLPqp8MdiauUIeaEOimIfX
X-Proofpoint-ORIG-GUID: PDifF17UPvbLPqp8MdiauUIeaEOimIfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On Thu, Oct 23, 2025 at 03:53:49PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
> 
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
> 
> We have already tested the display functionality using the Kaanapali-mtp
> device on the Kaanapali branch of kernel-qcom repository.
> Test command: "modetest -r -v"
> kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
> Yuanjie Yang (12):
>   drm/msm/dsi/phy: Add support for Kaanapali
>   drm/msm/dpu: Add support for Kaanapali DPU
>   drm/msm/dpu: Compatible with Kaanapali interrupt register
>   drm/msm/mdss: Add support for Kaanapali
>   drm/msm/dsi: Add support for Kaanapali
>   drm/msm/dpu: Add Kaanapali SSPP sub-block support
>   drm/panel: Set sufficient voltage for panel nt37801
>   arm64: defconfig: Enable NT37801 DSI panel driver
>   dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
>   dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSi PHY
>   dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
>   dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali

The order is wrong:

- bindings
- driver changes
- DT changes


-- 
With best wishes
Dmitry


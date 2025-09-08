Return-Path: <linux-arm-msm+bounces-72660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0517B49BEE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 23:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DC507AA391
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D80F2DE1FE;
	Mon,  8 Sep 2025 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8yC9GTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7D2DCF63
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757366933; cv=none; b=dHSWCuA8PRA9YI39i4zmvSRXuqP5n8wr/6Idk3iLWtU6UrYB+FQPIC7wHXTDnbCSlDqCT2q0yhge74AOL81HNb0ehRdCYRUE33CIoFSmss5UvyVG/M1PTS6HOKxu6f+xRCqtIay5vOaSHlnl4e96+XPt6mCkNt9Xgtw3ZhbbDkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757366933; c=relaxed/simple;
	bh=+ZoPjLjiNsqFmJXpuAMJ4g8JISQ38PkgMF8oH8CfkM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QpQUD5Ric8+KURuxUBhEdJP4URnsrbT+yCn10lYCoK4rEaHZ8BSn8yx4T+Q8mM6u77UDd2C/jxR7y2D/dj00XUftllTNbA3vVkDC17EOa5qKXxJIpApaJosWxjNls7nUzngKTidQlUy6oBavjCdAF+veJYxqr3+v2xeocHbkl5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8yC9GTP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GoH0I025960
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 21:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScGHARm0oECuOzEJcN01KKnFkQXnrnAhZVDiz2pnvYA=; b=g8yC9GTPjmhJQMGT
	uUOy5evnTxnRCeX/AW3qA+wqtjLA3UcDTti6WGQhYyYVP3SjtYwOjdbw/jNwvRc8
	z4J4KyuCwIf+ecjX4/jgHzZ8rq6hQi58KAhCGOACxwphsb9IpPX5J/ZG2QUGcwyZ
	ejnw2RjRXmK5PKolDX7IPGKCx8+vip63cL1N6NVPi7Wceh10oGuFGWOptdX0NYmZ
	lq3CXecrNQqcfhnrT3Dzoo5Stzy9IYRxSzbF4ZMR6tYANZ3q800QqFUX9KL+9YvG
	pjiEl1FXmL8v5UG3vosFRGGazLaW+0Vx/vF7/iyW50dUTE9QyM2BJ6VeeozwF/kP
	ZKTqNg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kwvea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 21:28:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7248ed9f932so61123436d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 14:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757366930; x=1757971730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScGHARm0oECuOzEJcN01KKnFkQXnrnAhZVDiz2pnvYA=;
        b=Grx7REMj10mAERGbW11J7rz38PjsgmPU58K5x2CMWIZ6f0XMy1XOTeNJx53N6mI0U0
         ThOzgQpUVtH81E/rPp0N1KpjL8PRUrRjSN65q9pu/Mr7teWzHWrWqt1JE6UQv9bFX0DY
         g2gsyDMc5jfiXfBk93zL7A5invpbIjFqvrjnFdtUgxHWrbXex7eFVioUYaKY2hq/hgZ1
         VeEhFF6EBBPhp8MSHvaFAT3fvy5XTb0mhEqsYTggSx3E3kZ3bSHWRMJErDD/UfViPGYR
         9sYpWdVQ01bJLDVtcyDf96YvL7r666bz78s2at80epuOoWZCCHd8hq9nTFTHhcxi52MI
         xzyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMacCIfjKOzWmcLKd7/L6PLgQ0RNQhn/hTrBiDtCd1/BHtvif7412nnKmfeGisvC37kz1zVb9Q4cxzhLOk@vger.kernel.org
X-Gm-Message-State: AOJu0YxzjziqnvvCqNgnrmfge129zZEA1E7F/XO+/b0uDok7zoO5u549
	h/fzRa6Zc/vNh5kzmAVLWvROYvw7hhsYGx7q9ZYdAHsJolm2V87GsiNY7Du7PwBeXQRrfyms+xg
	4JbUbfXgJzjjVHyAb0Yr6QN4Nc7w/a1moY0GVf/lhcB/+ORdMQ5QVq/vrAA1RAqsXPS6M
X-Gm-Gg: ASbGnctzrG8m8nfiZy135inUlrNH5RshhCAgAdUNZeFzS6s2zFdXRDUKE0HmY6s/sqv
	u8UttflcJAHku5FFYPZjiuLC2iO9OXSGPZjjSyDSyXlH7EotIY+FXvsgvQEa2i3jt8jr9n813BJ
	Y487hDokf83+SJ6quyPZ5HJuoshtrOQRVBsTtSqICE8C4cge+SLnB4N47TUoN8qmFZ5VVViT10u
	fWk3WFQxvmNSgss5O31wc58M2whgIWJXuQ2ardrerX52VW2r89rQjpLQililwI0Yv8+dek+6ILu
	rv8Y7d1tt6WF2TTsJMzsdGL/TRZ4dbGuk1y55p5JAxmGNJJ7/py4BgL+imXVuk/eYaDXPbB7lsz
	//S20gwv4uK0P3s+frz1Ig026P+b/Iwl/d60VXLmBHcWI0uy7AbzZ
X-Received: by 2002:a05:6214:496:b0:70d:fec6:494a with SMTP id 6a1803df08f44-739258aab01mr109441996d6.17.1757366929573;
        Mon, 08 Sep 2025 14:28:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFvWg9eRYub8/7m0Za7JpIIl4RD41FM6MBXJkA7gLyefolZO08FSmz7yplGf9/6bML7UCQDw==
X-Received: by 2002:a05:6214:496:b0:70d:fec6:494a with SMTP id 6a1803df08f44-739258aab01mr109441656d6.17.1757366929103;
        Mon, 08 Sep 2025 14:28:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795d445sm31486e87.71.2025.09.08.14.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:28:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/5] arm64: qcom: x1e78100-lenovo-thinkpad-t14s: add support for HDMI output
Date: Tue,  9 Sep 2025 00:28:46 +0300
Message-ID: <175736691957.998930.6661595469735181143.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX4wMwc0Yh01eV
 OA/3rnXOP/ve6N3j0L8qCZNMEclHro7OrM7HtkuS3Ncz60eLOA665/iZadvqnkRlm9uZXQcxwLY
 E2QBxKzwtSnUVJM74fSf6f9JELRa/gutq0UvevjEiR7S7NAfwa+XRraDy9L0sF6+CF9lt19+6hj
 5cuh/LlX+ZEybbSRPp1FzQtOKU9gXWPFU+KBjvnwiywdZllIeCZu5E2WKsxdvPmzLVR/fSgwFvM
 3Z940vBXlEZXwEL5nMIi44fGGxc7R6R+oItCrBfPc4FsQWmNPq4Eo+E3qygdUt+IP2U+GSAtmOm
 PUeUnvDAc9YUSFmyLY481gRAtRm/u1QnoCnr7gi8b5Nt2q9qtWIBmRPRJcw0klcP0lUABWj7tC6
 npPg5pMe
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bf4a93 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=mli57nIQh2RWQkMICy8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: oy-WFVzA4GKNR1iq0whW8he_dxiUmAqs
X-Proofpoint-ORIG-GUID: oy-WFVzA4GKNR1iq0whW8he_dxiUmAqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Mon, 08 Sep 2025 15:04:17 +0200, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
> 
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] dt-bindings: display: bridge: simple: document the Realtek RTD2171 DP-to-HDMI bridge
      commit: 2c4f536c75217476baabbd557a44e8d4c3a2a23a
[2/5] drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI bridge
      commit: 7156602d56e5ad689ae11e03680ab6326238b5e3

Best regards,
-- 
With best wishes
Dmitry



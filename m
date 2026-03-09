Return-Path: <linux-arm-msm+bounces-96191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL+5JCycrmk7GwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:08:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B56236CA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 691B730360AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76A538E12B;
	Mon,  9 Mar 2026 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXB0l7Ds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grdjPYLr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8538E105
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050806; cv=none; b=PaMsD5FDgNl49HtrkC+GanyYentj6eCaW8Rg3HNSn0+SwJGiJuIDR6y8hyoFGmqHo5ng8IbTvzBeiMWCcqhuW9oGTVFmu9WXDSztQtas2CPYJOfYP+B5woM7ZjrqPUcvj1wLzMlPto6+S+S+iUmohcn9WZeC9f0yaKzFSLU9jcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050806; c=relaxed/simple;
	bh=Xpokzs3ctMtyS6Ahv8v+LUMk0jgZQoDcfpKNWtP7CsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nT7LBRCQMk84jIej2MCy/m7dp0tePbTxzdKaN63rfGo6r6mj7B7N1Ux4a8NN+0rOZemSsxv+any8PU0i+sZXyveGIJMKvS7shTsVpeT9cWfO/2HdbURGVm2n7CEHHlD5ZNTB0fW34CP2I3Co0kT94z8BRyD7QE+/GLL5u/CWnXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXB0l7Ds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grdjPYLr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294fN7d1588528
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddQhb2iUz44RVRkeC4uUB7Q5/Dg6e8+Q1VmglwrVDpA=; b=BXB0l7Dsv2aV7BDZ
	38eNdbGS/GwV60nRy6UsoPbdHwOMhIgeJ9Pk083V17mZD+iRIVw4lk1QKJBS9uU6
	ICkh/29IMPozE+CsodI/k6oXn7xCVZmrOZrT/uVlliNEPLi2jC2o+PLH1SILvmme
	KIpt6T3r7ZwobNtcC/iL11GpA8rZfBHQr4uQOmB9PojyEeiH/O3gsR5sQLr+QY2/
	xVsRamYbNg0ZvrPjkQsiDa6bbC5UOYYmYS8bMowel37mMoWgpXXFkOTV1+7FtooZ
	gJA1Hr0TloyLYGRuaDlZ879wxI6axP8DmlOsKhSh52/8zCPDN0SOddnfuSzxfur0
	1Wp2ug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy920q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:06:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fec8d44so680131485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773050803; x=1773655603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddQhb2iUz44RVRkeC4uUB7Q5/Dg6e8+Q1VmglwrVDpA=;
        b=grdjPYLriI/yx3vw6w9kMelzQQhFuk+42pGNOXVis8w0YcDK9wZChXOLf0HaDf3eNy
         QQhG0Zq4kW12+FRvQuxbSkpObZo+CPpZTU/0Ogx5Hj3VHVdpK0cxHobealyF7KCQzjPM
         15RqEYGxSkTsMQSPvF+aT9leHeo19ZrIUNmP9UEq73fm/CFBaVg5mxOYxAkA1I8WreTl
         rgM1Gt2DwWvbEVCaHmWIyCSfigCjPs9a/fbIMUoS0zn3/VtQb4dN3EuRd5wLuWDnIMUY
         wthVl5yFKnFfTDddyfT0waFEFDI1E5OW2wgMSXKjDojG4o83HEjixzISa8uOr8tM7yxh
         cyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050803; x=1773655603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ddQhb2iUz44RVRkeC4uUB7Q5/Dg6e8+Q1VmglwrVDpA=;
        b=Bc3yzHS+h2jzde9Ynh0k1dsog+W51HKkBBOS3p6RhRn90SV15Vw2PUXX/SP2+fnxDu
         09W4ATNiq8Mynqs0uo3flzgVZEEc5TXTwNQ7j31BBrIk3YmeqPjzkaMJmwl5A2oR5YI2
         BRkPd2N1FplterXKMrFo1fjq56/XQt9Nwxn5GkhXmXkbglNk6gGet+6MY3Oyc5hob3yd
         gDxfD12UGKZ2YudKjncPsuhXcJs8fVBqUdfqCKGAIbz13onZ2P6tnfp3SXtDA9bryTc/
         i5wZwx9pFCIDsacOOrkuhYgmpiDoxUCcygeV28mR0oSWDhZT4VREVcGPZgU1iERZbkTM
         B56A==
X-Forwarded-Encrypted: i=1; AJvYcCVdwCe4MU0fOKhsSwI6pb+1KWjUxXRw2k6zWW4DgMNvh7AvG/CUr3OfwkO7sHU/9oRj+KFvj52wLp36/rRe@vger.kernel.org
X-Gm-Message-State: AOJu0YzJl2QFzZBnXyeoD6XO1mGDwmazWnTOi6/Dv3Z1xECe2twraNf5
	1+guI9WL868HcgNZxkq9mnxE7VR/bShpOM6RlDEpngwPrZi5sPd9QDs2oiZzkBVf1KC5rBtkAAq
	+3tpPuJzBoHJ9LVrGlxn95CKWEnh2WnjmFv7FmN+i4j/DDQgkAGd2WufRzFxyf3ONJrrk
X-Gm-Gg: ATEYQzyFO5tWV3Ru73DyYM1U1Iiw70eihwNNhNTkRvgiX0AeO4OL24RES5BIWrh5L4f
	0NCkjwQryhkg88GHRJ1dBMoW+T3Ft+1CZ0MD15hz/pHV5jOxpMXSyzAFocKAPcK/dFKncmevSuo
	7KmO/OsCCAKoZ6AZmqBVSgVBuMpb8lNG0cniRpbgQHyuCdYkTUPf6H+Of7XmXKfeHsZ6dxPsQsl
	ZXmGAabW6F3JfOUWfeZ1yKGxCZOtihwRlBJiVWC8ikPxoLcUiBBc/pAzUTLA0C5pGlhF8Mqy9N5
	DOH6nzXgZhmyLMhSe7sM23YCPS8MmY+wMFKNEZLW6pYHlq3cxBLJyTxBgKClL4R3e950fnErAbo
	9y3un0HUEfDyeHvE/Aw1BsQZaPgSZ8g==
X-Received: by 2002:a05:620a:4608:b0:8cd:8bfb:a64 with SMTP id af79cd13be357-8cd8bfb0e92mr216692685a.31.1773050803233;
        Mon, 09 Mar 2026 03:06:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:8cd:8bfb:a64 with SMTP id af79cd13be357-8cd8bfb0e92mr216689985a.31.1773050802685;
        Mon, 09 Mar 2026 03:06:42 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm24114052f8f.3.2026.03.09.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:06:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 12:06:19 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: glymur: Tie up the CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v1-3-f682c82f116f@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xpokzs3ctMtyS6Ahv8v+LUMk0jgZQoDcfpKNWtP7CsY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprpuokVYfkpzOk34Moi+BzqGr4PBVsuDaqKVs2
 dYK6R3RPUCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6bqAAKCRAbX0TJAJUV
 VurGD/9f5Vb3IncoIueNTIe+iAvxdRf0goVhYseqstgqlah7WI4BnU8LfT2Nv5yIBGCu4DH6AWu
 N58O0qKa2OF6UrKcfUiN5JtvOtuz9FdCytSDYfuR4KHkL0gVG807SXiloc0tlhVPNWa68AOEeHj
 BG+oubDwOJP3DuYWubGvtFd6aRWusTtXoZzUYXOhscO2QPAqTRfKyDFDMBEkjnLEAe7xt/qnOxH
 IEMS/RV1mYBK7jSIp/idYcIUMje/Qxcx7BVMjDPaShWqJagCC7pyHvugqjnaa/VYwbt69RTkLgE
 ZtaN1qPbQqn8QAwfPfqZunhsSwvkwOhVUAtbnzIbIO4IZF1v5HRAnvufFxS+irP20jDy4xpqAqv
 tp5xfJ3wIqlETkK8XAaPHNuicIepoC4pVK2wDp24TROX1LiBzypn7dthKkKST7P/oWGI8ZFAMLE
 teznw+DgMgV75i0+mnJBuXDqkwMVqZO4Rxrojj4VKoogANh6PVEIi7ZtMP2Ir2XmLPBtk9O0QwD
 oMBvFMnIbkNDyUzLmX9Z+cCyvvBl4d1kai5GJXr5cVDYMRtNElKPOn4JEN8fUsQhqUTidUCwrEb
 bhu+TBrzynZHMmcm1KtDxpPu4WDzuC1n/nY7uyWr/Wscwmh8E8U7eBR/e791PmZu6YA+QQGPOSn
 fBVMsMfhwh5M2+A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MyBTYWx0ZWRfX49iDNWz7nUIf
 bBqzbNx3EXPXPmpJ9g6nxsa61XvkiaEaAuLZ5/36s/zmrDnpviiUuM3A2vbwc7e3nqgix7+p7Sd
 SQwWj7vbtzJRgzVGEkjAaIHowxrVhxXJQa0fHRUj1BBv9Sr79QwxfM0bdsfrr7hZMttdV6yOKNQ
 81OX4lYB7gLdtHlHlvpe5Q7ondGbhFd4o7jhw0SisB+S1ndPYByCJZEcEEt0x3In1cbhdBy7PNh
 8wmZHIavgp52SPRGc3Mgxyzd/KuE8bXjgTLMWkhRHE7L+Ox5wj3ESzeFVVgeBj3gAQ0EGDIIRlg
 Vx9eQpH8sURLepA1u5v/anXMxduotxbS7WLM1FdnM4O2w6KGCDwiiUefPjLEmwcEIB43RVukLpn
 7ZqlrbWCsldAE2WYZNdOPF8P+uAZIMd41LtU51IpD5/lmPKPOu09ZjzvSup6yKZsqgqzzrODyHP
 2YSeptGH8Whr2HOkP/g==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69ae9bb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UtH7f_zyWO5jlmvt-A0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TJv2viCtEnOR4QJEdtinYXmhq3lPlulP
X-Proofpoint-GUID: TJv2viCtEnOR4QJEdtinYXmhq3lPlulP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090093
X-Rspamd-Queue-Id: 09B56236CA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-96191-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.12.53.0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,0.1.134.160:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.935];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

It has been concluded off-list that the Global Clock Controller needs to
scale the RPMh CX power domain, otherwise some of the subsystems might
crash or be unstable. So adding the RPMh CX power domain to the clock
controller which will result in all GDSCs being parented by CX. This way,
the vote from the consumers of each GDSC will trickle all the way to CX.

So add the power domain and Make sure the required OPP is nominal.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c..2d1ffbf53730 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -764,6 +764,8 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_nom>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.48.1



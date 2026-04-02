Return-Path: <linux-arm-msm+bounces-101580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALOFEnnXzmmGqgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 22:54:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5617B38E282
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 22:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5E08300DF6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 20:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23149345722;
	Thu,  2 Apr 2026 20:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVk4ORFb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iH2sSUYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0D35F185
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 20:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163213; cv=pass; b=m2Cv5VOrQH0qONvAVaieENOj1d6evP+prdm2MhBxAFldj7hdlFV9gKi5eIYMfTlPLrW5QO9Yn1RuxB/8O4TVV6ATQJtKkuV6HoLlypvlAr/0lfTcXh1edU1nQkad6OK06pofhb/bxq7OV68P8IXdeBp5zW3Ay4KmQKuaKTkzicA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163213; c=relaxed/simple;
	bh=5XluXqC96sXQ/XFuqFIaX3+Jd4hLf3emaRDFJfPT+Gg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mOSLwffIgTjhghNtUfRmA1s9W9Qc1KCI4/OoJbtJVjkVjHaFRaw3xJuaj0KNV8A4hPdGpx1oryytofbbCqeZBC/oOdqiT+kK3hHlTbEqR75kPz/MRdzzNaspMbdqbezjTSY87HE3AkdbFGWDX5cJKAKFgoax4UhatuqvHm3wyKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVk4ORFb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iH2sSUYT; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632KkVQK226807
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 20:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to; s=qcppdkim1; bh=dDm6c3qDsHP78
	qPWF1q7Kd6t7clJoKPs7hS2XdCBD3A=; b=bVk4ORFb00BKbYeyj1EjegZMFGBFD
	9CwtS0TMo/QMO2Nvf9e16CgGUiNUuuvFTUameAmRQMU1UwF1VLv87ozznqvbCBzy
	q9FsRaPMi/IAG4Tl+dFGjOcnm+A6fsz7yva7C4jQtnL/WK3j6gEIyPU7ZSMF3VAT
	h0caSnj8SllyZkbBwl/G1rKI+f3AmTLdC++a83E6gXjo615G7AjUFwoFA5fN5Yqc
	g31YFkuhoK5LJGpDFxaNPox3+iSs7hZZgJ3eQAyw3dgStXNrWOY1mJmMee33z6ya
	OKMY0EEzY5FM/eQGh8XTzlYZ0ZJzqyKWSkLlEGuOhjx3O7EJtLVX3o28Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9r0u1yuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 20:53:29 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d740d7e5a3so3148632a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 13:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775163209; cv=none;
        d=google.com; s=arc-20240605;
        b=kUPrcLoDc1aqphjWb3Vd1Vq+m7mhiwhhif3JGHO8/ZlUfTjj9637ZW979lPovIXVCN
         dOizWD/pKBmHr4uyQEq6i9uhucQ8wpobalGcM/41botUhcvQJ/YYMg5Idfr7qIsI/RBj
         jdx6FJu1yAzI0wOyslxh8eriFkFJOCohdUQUSm0LI5vuprii34cl8ad5GfzNIgwbVykp
         uoLDASmrhjrZxaIyuRdEiBQ1o6auaYXQtyNAI1HLyFIagPT7tSEeEulEimrPAJXWP7q7
         D8AIkgTrHzxVSZ3IyYT7E7Tc/2wgPj7AlLQKWx6yprxH7mCKJrq1H6LKoAht54feksX8
         rozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=dDm6c3qDsHP78qPWF1q7Kd6t7clJoKPs7hS2XdCBD3A=;
        fh=yMID7JeXjlzCR0nmNaIIgOfiqHIBvTquVuz4R0l9ds4=;
        b=Ed/wnSvQ8GJGaooprV8tC/7QggJqvF0a+W66yF8A6G8W3QfmPjmALndHPjyS2u3rGm
         bvfHlGWBHWl5qNM6jx3TT/vMYfHYzO7yq+NbQ4UVJ7yExwYrPPpkKDo82emQAp7KvXWT
         B/R8wsdp3ikdoalBrzSzXF1gTVf8HePLkzO9Ge4vwbT8iEDYiikXNggGLL+Dy477UIju
         +RBCkqryOrlDqKcB5D7Q2+fh8eRWn5MY0zNE2K6klCzBsXMuzsqTmz0OvUj7lDvrgAnX
         sCVPsJMt7/Hs+z9mvEDWeuYhvlflOtA7ZVSldeWzW9G8Hn4C2SsvJ0stJolhRaQX7mNC
         tVbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775163209; x=1775768009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dDm6c3qDsHP78qPWF1q7Kd6t7clJoKPs7hS2XdCBD3A=;
        b=iH2sSUYT9XCNkw2f0Eca3EseqgRsTH+Dl/jUbQ9QJv9rOoZe6j7e1rl8+YWF41bM6f
         zYHpSVlcJsgp7Zd6BrJANgHGLp8CqwlVXiT8lYLzP8j6hhzFBVMLzupU+eZKd2qgjIR/
         dKmJ+CJBXuK/FTWCyBDCBD84YXPZb5oXSKajefvIXThGNNmNdjZFDmmi7fK6Jh1f1NMU
         6BNF6hlc3fynLzR62Y6DbDFOuMwz1d+J/b25BOnj12PCjht3SilAoGB3N680umPQR4EQ
         yVn9Vmh54eJJ/H5EfZvChc3NmUlQcJSFUky68rM002a8Ff1XJNl8mYiLyNEz23uoDxHt
         mX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775163209; x=1775768009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dDm6c3qDsHP78qPWF1q7Kd6t7clJoKPs7hS2XdCBD3A=;
        b=jLH6lsxkDoFf/8/QlmDFbL1X3DzfL0mTSVcVM4aVLxBo8BFCBHrulbiLrWxo8hMnE3
         Y/NNKl6Yux5qE/Frir1W8C08P+MoPXWcZKMNAVx6uKfXDFSLxn+9f/KfLfcA8Tm6W4xj
         g4yvaICHDv59AaNtVtfDmUYxdpKKQFp6Mmxi0xD72OIpR+i7Oa5UzxpEF7mUZ9lJlrJ+
         YMDH0NQa+EXp4NlzBER+AsL4jewdstsYvRcicuIQimQ1Vc8wNbODQJr7z4YWYzgiMQ3A
         35aKZdNAPHJ5CK59dJTdT2VF3IWGe2Jwxf6UbCIqFHS+QUKTJk9wo0X7jT9tbOMnuOWv
         C7kw==
X-Gm-Message-State: AOJu0Yy9YRST/kz1HVzU4wwuGalInEiX6RiS0j/fJZ91N/0pbDsv71t1
	Dftb2vgFDhoHJiilsQTS7KeBZLYVv5bMKyOB2ec3fpJw0+tzCa8XaVgm77rTV9oO81QOTlJI2cW
	8TeFUPV522n4eQxrIrnzlpDxeIfChGFxlMuYMsYiRMG1Rw+MjaQOQM33qRzk+BcYjteU+gf5AvF
	GCkdP6BoDrUKpsqmm7qxZCscV7VVQM45eVF9nHZ4BqDaw=
X-Gm-Gg: ATEYQzwsfBChYFIkODRsZPC6iwqNc5n6qXH0e7xgNHDhhd+vPQclEtJFHU5pbfaAa5V
	TjhJURx/QhwMX96rRL8YbfxD/yzgmSmYw+xNhZdRQJWKjmLjHMjVXs5uJI/+fBrqZzqYIw56KTd
	/2Ol86Bsi/m2tHILoHyB21ZceuPBn9YPgdZ7hTBAZgxmtxGB2L4XASxDPpomHTPmhSaA019Dcnj
	z22z1dVUKKLuFOh5NMA965fBSLj2v3QTX6CYA==
X-Received: by 2002:a05:6830:621b:b0:7d9:d2b6:1568 with SMTP id 46e09a7af769-7dbb70bcaffmr696781a34.17.1775163208667;
        Thu, 02 Apr 2026 13:53:28 -0700 (PDT)
X-Received: by 2002:a05:6830:621b:b0:7d9:d2b6:1568 with SMTP id
 46e09a7af769-7dbb70bcaffmr696757a34.17.1775163208087; Thu, 02 Apr 2026
 13:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 13:53:17 -0700
X-Gm-Features: AQROBzCE4N3vajtbHLMqR6j8nRYmcSLgM-aTdc7MN5GJz-yQAoG9U-ttf7wsRmQ
Message-ID: <CACSVV012vn73BaUfk=Hw4WkQHZNPHiqfifWEunAqMc2EGOWUEQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2026-04-02 from v7.1
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE4NSBTYWx0ZWRfX2g+xRjxgFdF3
 HLPQkSDM1pI/AJB+VmC6GK1xsjU8dP5jZiYO6e96TjwYUT/dSHZDArgG0eRGP7uW7PxBGmhq5OX
 gVrVE0A1DgbztYZ6tnYcW91cKKPWFSeQVZwFfAWw//tT+n5AlWnWUyqdaHq/+fNkiDX/MoEk8C9
 V0DKMS8Ir40Jlf5FIFcrAARhi0S6qmVI070Se8haf3YP51cQ+GoVrEVysfUhWgDTGeKMQj2xzx2
 0fqJ18a/fPnyCtBsBLhAsXSgYoY0IUeAgpJ49spk5zZROuhT79qrhjIPtLyyIRPzKi7mF4Xmly+
 w9c8kaPYQctZ/Y0CYJb/SERSlwMDAxOALhHQszHW61cI9UImfoh1f/bYAca8DU13lFxRWHYZbIv
 8O9wmUeo36XUc7K/f6xosvKK+xVh6VUEP2rSNeJWDso7lUYnLy9tyWRAf6/c1tCinC6Kmm/ZBYA
 7A2sa0vliuLCt3qK+/w==
X-Authority-Analysis: v=2.4 cv=D5xK6/Rj c=1 sm=1 tr=0 ts=69ced749 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8 a=-sR6BHqNiBfvSRoBq1oA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: yqztsQrCdiOgvHeQtSg0Hgbdm9B_gbEv
X-Proofpoint-ORIG-GUID: yqztsQrCdiOgvHeQtSg0Hgbdm9B_gbEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020185
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101580-lists,linux-arm-msm=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mail.gmail.com:mid,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 5617B38E282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave, Simona,

Pull for v7.1, as described below

The following changes since commit 50c4a49f7292b33b454ea1a16c4f77d6965405dc=
:

  drm/msm/a8xx: Add UBWC v6 support (2026-01-22 01:23:22 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2026-04-02

for you to fetch changes up to a972d1b864e8efcfda0b387debac8ea2875a182c:

  drm/msm: Use of_get_available_child_by_name() (2026-04-01 18:05:05 +0300)

----------------------------------------------------------------
Changes for v7.1

CI:
- Uprev mesa
- Restore CI jobs for Qualcomm APQ8016 and APQ8096 devices

Core:
- Switched to of_get_available_child_by_name()

DPU:
- Fixes for DSC panels
- Fixed brownout because of the frequency / OPP mismatch
- Quad pipe preparation (not enabled yet)
- Switched to virtual planes by default
- Dropped VBIF_NRT support
- Added support for Eliza platform
- Reworked alpha handling
- Switched to correct CWB definitions on Eliza
- Dropped dummy INTF_0 on MSM8953
- Corrected INTFs related to DP-MST

DP:
- Removed debug prints looking into PHY internals

DSI:
- Fixes for DSC panels
- RGB101010 support
- Support for SC8280XP
- Moved PHY bindings from display/ to phy/

GPU:
- Preemption support for x2-85 and a840
- IFPC support for a840
- SKU detection support for x2-85 and a840
- Expose AQE support (VK ray-pipeline)
- Avoid locking in VM_BIND fence signaling path
- Fix to avoid reclaim in GPU snapshot path
- Disallow foreign mapping of _NO_SHARE BOs
- Couple a6xx gpu snapshot fixes
- Various other fixes

HDMI:
- Fixed infoframes programming

MDP5:
- Dropped support for MSM8974v1
- Dropped now unused code for MSM8974 v1 and SDM660 / MSM8998

Also misc small fixes

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: display: msm: Fix reg ranges and clocks on Glymur

Abhinav Kumar (1):
      drm/msm/dpu: Correct the SA8775P intr_underrun/intr_underrun index

Akhil P Oommen (19):
      drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
      drm/msm/a6xx: Fix the bogus protect error on X2-85
      drm/msm/a8xx: Fix ubwc config related to swizzling
      drm/msm/a6xx: Use barriers while updating HFI Q headers
      drm/msm/a8xx: Fix the ticks used in submit traces
      drm/msm/a6xx: Switch to preemption safe AO counter
      drm/msm/a6xx: Correct OOB usage
      drm/msm/adreno: Implement gx_is_on() for A8x
      drm/msm/a6xx: Fix gpu init from secure world
      drm/msm/a6xx: Add support for Debug HFI Q
      drm/msm/a6xx: Use packed structs for HFI
      drm/msm/a6xx: Update HFI definitions
      drm/msm/a8xx: Add SKU table for A840
      drm/msm/a6xx: Add soft fuse detection support
      drm/msm/a6xx: Add SKU detection support for X2-85
      drm/msm/a8xx: Implement IFPC support for A840
      drm/msm/a8xx: Preemption support for A840
      drm/msm/a6xx: Enable Preemption on X2-85
      drm/msm/adreno: Expose a PARAM to check AQE support

Alexander Koskovich (6):
      drm/msm/dpu: calculate data_width like downstream
      drm/mipi-dsi: add RGB101010 pixel format
      drm/meson: use default case for unsupported DSI pixel formats
      drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      drm/msm/dsi: add DSI version >=3D comparison helper
      drm/msm/dsi: Add support for RGB101010 pixel format

Anna Maniscalco (1):
      drm/msm: always recover the gpu

Ben Dooks (1):
      drm/msm/hdmi: make 'msm_hdmi_pm_ops' static

Biju Das (1):
      drm/msm: Use of_get_available_child_by_name()

Connor Abbott (1):
      drm/msm/a6xx: Fix dumping A650+ debugbus blocks

C=C3=A9dric Bellegarde (1):
      drm/msm/dpu: fix vblank IRQ registration before atomic_mode_set

Dmitry Baryshkov (18):
      Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
      drm/msm/dpu: simplify bg_alpha selection
      drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()
      drm/msm/dpu: enable virtual planes by default
      drm/msm: add missing MODULE_DEVICE_ID definitions
      drm/msm/dpu: don't try using 2 LMs if only one DSC is available
      drm/msm/dpu: drop VBIF_NRT handling
      drm/msm/dpu: stop declaring VBIFs as an array in catalog
      drm/msm/dpu: replace VBIF-related array with bare pointers
      drm/msm/dpu: drop VBIF id, base and name from the catalog
      drm/msm/dpu: drop vbif_idx from WB configuration
      drm/msm/dpu: drop VBIF index from the VBIF params
      drm/msm/dpu: drop VBIF index from the struct dpu_hw_vbif
      drm/msm/mdp5: drop single flush support
      drm/msm/mdp5: drop workarounds specific to MDP5 1.0
      drm/msm/dpu: correct DP MST interface configuration
      drm/msm/dpu: drop INTF_0 on MSM8953
      dt-bindings: display/msm: move DSI PHY bindings to phy/ subdir

Jun Nie (3):
      drm/msm/dpu: Extract plane splitting into a dedicated function
      drm/msm/dpu: Defer SSPP allocation until CRTC check
      drm/msm/dpu: support plane splitting in quad-pipe case

Kees Cook (1):
      drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation ty=
pe

Konrad Dybcio (3):
      drm/msm/dpu: Fix LM size on a number of platforms
      drm/msm/mdp5: Remove MSM8974v1
      drm/msm/mdss: Add a TODO for better managing the MDSS clock power sta=
te

Krzysztof Kozlowski (16):
      dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo
      dt-bindings: display/msm: dp-controller: Add Eliza SoC
      dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
      dt-bindings: display/msm: dsi-controller-main: Add Eliza SoC
      dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
      dt-bindings: display/msm: qcom,eliza-mdss: Add Eliza SoC
      drm/msm/dpu: Add support for Eliza SoC
      drm/msm/mdss: Add support for Eliza SoC
      drm/msm/hdmi: Fix wrong CTRL1 register used in writing info frames
      drm/msm/hdmi: Simplify with dev_of_node()
      drm/msm/hdmi: Avoid double error print on msm_hdmi_get_phy() failure
      drm/msm/hdmi: Simplify with local 'dev' variable
      drm/msm/hdmi: Consistently use u32 instead of uint32_t
      drm/msm/hdmi: Drop redundant 'int' for longs
      dt-bindings: display/msm/gpu: Drop redundant reg-names in one if:then=
:
      drm/msm/dpu: eliza: Use Eliza-specific CWB array

Pengyu Luo (10):
      drm/msm/dsi: fix hdisplay calculation when programming dsi registers
      drm/msm/dsi/phy: fix hardware revision
      drm/msm/dsi: fix pclk rate calculation for bonded dsi
      drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1 to
DSI_PHY_7NM_QUIRK_V4_0
      dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
      dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
      dt-bindings: display: msm: Document DSI controller and DSI PHY on SC8=
280XP
      drm/msm/dsi: add the missing parameter description
      drm/msm/dsi: fix bits_per_pclk
      drm/msm/dsi: fix hdisplay calculation for CMD mode panel

Richard Acayan (1):
      dt-bindings: display/msm/gmu: Add SDM670 compatible

Rob Clark (9):
      drm/msm/adreno: Change chip_id format
      drm/msm/a8xx: Update GPU name with slice_mask
      drm/msm/vma: Avoid lock in VM_BIND fence signaling path
      drm/msm/a6xx: Add missing aperture_lock init
      drm/msm: Reject fb creation from _NO_SHARE objs
      drm/msm: Disallow foreign mapping of _NO_SHARE
      drm/msm: Fix VM_BIND UNMAP locking
      drm/msm/a6xx: Fix HLSQ register dumping
      drm/msm/shrinker: Fix can_block() logic

Sergey Senozhatsky (1):
      drm: gpu: msm: forbid mem reclaim from reset

Thomas Fourier (1):
      drm/msm: Fix dma_free_attrs() buffer size

Thomas Hellstr=C3=B6m (1):
      drm/msm: Remove abuse of drm_exec internals

Thomas Wei=C3=9Fschuh (1):
      drm/msm/dpu: Don't use %pK through printk (again)

Vignesh Raman (5):
      drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
      drm/ci: i915: cml: update runner tag
      drm/ci: uprev mesa
      drm/ci: move qualcomm baremetal jobs to lava
      drm/ci: add rk3588-rock-5b

Vladimir Oltean (1):
      drm/msm/dp: remove debugging prints with internal struct phy state

Yasuaki Torimaru (1):
      drm/msm/gem: fix error handling in msm_ioctl_gem_info_get_metadata()

Yuanjie Yang (1):
      drm/msm/dpu: fix mismatch between power and frequency

sunliming (1):
      drm/msm/dpu: Fix smatch warnings about variable dereferenced before c=
heck

 .../bindings/display/msm/dp-controller.yaml        |  22 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |   5 +
 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   7 -
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 494 +++++++++++++++++=
++++
 .../bindings/display/msm/qcom,glymur-mdss.yaml     |  16 +-
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml   |  30 ++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |   2 +-
 .../qcom,dsi-phy-10nm.yaml}                        |   4 +-
 .../qcom,dsi-phy-14nm.yaml}                        |   4 +-
 .../qcom,dsi-phy-20nm.yaml}                        |   4 +-
 .../qcom,dsi-phy-28nm.yaml}                        |   4 +-
 .../dsi-phy-7nm.yaml =3D> phy/qcom,dsi-phy-7nm.yaml} |   9 +-
 .../qcom,dsi-phy-common.yaml}                      |   2 +-
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/ci/arm64.config                    |   6 +
 drivers/gpu/drm/ci/build.sh                        |  13 +-
 drivers/gpu/drm/ci/build.yml                       |  22 +-
 drivers/gpu/drm/ci/container.yml                   |  28 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   |  96 +++-
 drivers/gpu/drm/ci/igt_runner.sh                   |   6 +-
 drivers/gpu/drm/ci/image-tags.yml                  |  22 +-
 drivers/gpu/drm/ci/lava-submit.sh                  | 101 ++---
 drivers/gpu/drm/ci/static-checks.yml               |   1 +
 drivers/gpu/drm/ci/test.yml                        | 119 ++---
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |  13 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |   7 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |  27 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |  24 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |  37 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |  22 +-
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt       |  27 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt      |   6 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |  13 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |  12 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |  35 ++
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   4 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |   2 +
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   5 +-
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   5 +-
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt |   1 +
 .../gpu/drm/ci/xfails/panfrost-mt8183-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-fails.txt    |   1 +
 drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt |   5 +
 drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt |  20 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |  15 +-
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |  21 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |  12 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |  35 ++
 .../gpu/drm/ci/xfails/rockchip-rk3588-fails.txt    |   9 +
 .../gpu/drm/ci/xfails/rockchip-rk3588-skips.txt    |  14 +
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |  66 +--
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |   2 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   6 +-
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 246 +++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 140 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 170 ++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  20 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  33 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              | 155 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |  77 +---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.h          |  82 ++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 186 +++++++-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c          | 259 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  19 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  13 +-
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   6 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |   6 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  10 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 363 +++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |   6 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  10 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   6 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |   6 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |   6 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   6 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   6 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  28 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  18 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  18 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  18 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  57 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  36 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  26 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  75 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 303 ++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  52 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 163 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |   4 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  94 +---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |  90 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h           |   1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   8 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  18 -
 drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   4 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  85 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  38 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  35 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   6 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c              |   5 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   8 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |  12 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   3 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c           |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c           |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c           |   2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   7 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   7 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   3 +
 drivers/gpu/drm/msm/msm_gem.h                      |   1 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |   5 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |   4 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  17 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  53 ++-
 drivers/gpu/drm/msm/msm_iommu.c                    |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   9 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   6 +-
 drivers/gpu/drm/msm/registers/display/dsi.xml      |   5 +-
 include/drm/drm_mipi_dsi.h                         |   4 +
 include/uapi/drm/msm_drm.h                         |   1 +
 171 files changed, 3319 insertions(+), 1567 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-10nm.yaml
=3D> phy/qcom,dsi-phy-10nm.yaml} (96%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-14nm.yaml
=3D> phy/qcom,dsi-phy-14nm.yaml} (94%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-20nm.yaml
=3D> phy/qcom,dsi-phy-20nm.yaml} (93%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-28nm.yaml
=3D> phy/qcom,dsi-phy-28nm.yaml} (94%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-7nm.yaml
=3D> phy/qcom,dsi-phy-7nm.yaml} (88%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-common.yaml
=3D> phy/qcom,dsi-phy-common.yaml} (91%)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt
 create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_preempt.h
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_preempt.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h


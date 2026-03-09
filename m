Return-Path: <linux-arm-msm+bounces-96207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPRnAZOormntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:01:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 369822377EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AA42303CD09
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB213939D2;
	Mon,  9 Mar 2026 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRAi9NU3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxyapSY5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2B39449E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053831; cv=none; b=OBHpZUiHc198Ccc9KuS5dKjNadCUQ7vjFycQtflpFXnNuwMVibqT4LHMpgbX7psNI2CSq4eAah4YGsHsZffrbfSGV9j4sFUEdx0NAKIMop1si69KMUdMlK7dWEYwiwVqwfYt9MA8TUtmNY69CMa8ubY+Qp6EN9TTPqO1bZcB4nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053831; c=relaxed/simple;
	bh=ycEYiAJoL+FqgnszKA84ouB/eimGnAqIo7mwS9MdNfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwYybqoirnjcwzuFcq0tHwX97QL8b1yZUuqI4lDqptxJCypva/l+qG2gwR9jEyk3FXJbqdFH8DGbHfsVnNyouxaHPBRoXAO2DfrfxdkNUaxW4vFRbxMuCNlxt0QA2xnVb5UNPFBgQS9npzvrs+H1zrWHP5rAA6yg/97AM37L+Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRAi9NU3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxyapSY5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629604OS1667805
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2KONUYw9KQ4WgPvHCbfWNJtK6lNQil1cMtOKIxodHk=; b=TRAi9NU3aYaj56Cz
	ynLwOup8mx+qjnrccGLxKt/IRhsrj3xUTiYF6kGfjJdBD0k47veLCmZwoBpAI9yy
	8JGedJzOZ5YqQQk7frCepE/5ouV7GeGElJhK4R2TjRMa17NxOTfKBVCiNMf06nqh
	UOQTYK6yLaFBVuqtIgzJiu3qIrrCw1/fz3XmfEkPJ9jK2ViBWt1CUnOTjYtkR4a9
	iWDeE1ULewAF7norsZ8FpdUEotluT5Axc3GH0mRCKZZbGvpIuUP12IcHwdZmQdTd
	XTdEm3Ij7x30Y70xyGypAn1BLARaeUcoVLYBASHz7sUbaxsvrKMGc00vOA2dxs52
	VT4eRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83d2pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:57:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd827a356aso665171385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773053826; x=1773658626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2KONUYw9KQ4WgPvHCbfWNJtK6lNQil1cMtOKIxodHk=;
        b=gxyapSY53YD7/ILKOpGTYutZ+0C0+lW0IPEsTn9BvHiGAqgjGF9zOSgFQbl/NndYN3
         /7toyDCMKwGB34Qe2gNuTQpiSaxojAgEPmj8WFpcjK58KiBdvLDyqyJbelbr8KVw1iH2
         dAGU2cEpJhNpw91nCp38K78p8EUjpyxrtligUyzm0T9RkNAjVUhzCz636ohRleLQFi7r
         sxvDXmX8kpCZSqhtV7wmy/r9WNXCSxHRf4HdfTMyslQUtDx1nC+oRCL+ZGBnzhXAKEfA
         zL9YufGCqSD1tDjNtZDQ+agh6RDuH2nxAmM/I9wqLm8KxfXGYlqwaU4YHozeD1WYVc1i
         8HCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053826; x=1773658626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2KONUYw9KQ4WgPvHCbfWNJtK6lNQil1cMtOKIxodHk=;
        b=DZP89P+mwuNbRawXszJ3+ZuES/wAw4bSKJzodcmJyNLzJeJE9VqdSVFb+BQUdNwecc
         9PNoFAdfa8vBB09vaR+5RtLx1KvuO0ksF5aKGpy7M96OIfnqJty+wPpek7hk0Ojc/8kc
         OKJK/lt/kKQzB5L9wX+Nj5M5u26TH3iVc86zHgWODKD6/7Q5VLRxWsNamWVnX44zcKXD
         IbLqUAWMt7xC9Typ639VgzpHuFtZej2+W/XX0Mf+OX2jY/BX8ve6e7MhDdPtMTL8NyMv
         SgfkOuit/14HZXS0nal1CLXCb4hhIwijXKkKKj3zJKTXhPxDQyk8CJA9RpuEqB6Ni1Tc
         ldaw==
X-Forwarded-Encrypted: i=1; AJvYcCWvhr2QzBfEeimAke1e2nGhmo/7TIsdJiqJxh7W0n4DGMdhdqsbNP8ryMP4ombAWhWlOraL5CNHuKfHyXaa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1w/2ve+K+cEoQgRHvyvolN/ChChretBiaVQ6wZAWBgZ2uBE6u
	PjyrFd4hLt3ufXOmAk0bGJY0wowu0PCr0w2Eac5zYrHQwHFQXVZrw0F0qZKPcAzyeUDQYJ9GW6Z
	U5tp9SpxcGQhD54YQk/WYn5ma3H42uoL6oJWyMHt6Y+5BqQ0J0Lp/sj8OPuQvVYEYIJft
X-Gm-Gg: ATEYQzwNLhe6P8Kel2hCfDh8faY+6iMh31FFAhBj07gModcf349IhwbAx+oiHfZInl/
	Ad0XznGJqAb8RyKSiFAiHLYGyX1LxjSjnKkPgFqdaMQzUpVmvAAc/Ye83DCMG1M5rdvO8UL3909
	5S3KBnGQ12aiYD0Ovt52zFp8f6Dfc2bI+L316AeeExvz40tc9rYjg1PDnF3Ldh3ESuAi1pE03rM
	aUKw7piU8DgcuRRC5dAY2CltOI7KtT+iMtivAeKNGxVTE+wD+FQvXtVLzX+xeMkB5fxm4zL2jr3
	CuWG59ZYiriSFF/nIEWPBQ/3F+sdvGHE8wI+fBeSCPegpkBnCaeWHUTlbQQ8HqNtG+gGYNcO7Sd
	Z2jUDp2mh1/o0xlksRgxELDKotqCiPg==
X-Received: by 2002:a05:620a:44d2:b0:8cd:80f1:f468 with SMTP id af79cd13be357-8cd80f1fa47mr676080285a.41.1773053825600;
        Mon, 09 Mar 2026 03:57:05 -0700 (PDT)
X-Received: by 2002:a05:620a:44d2:b0:8cd:80f1:f468 with SMTP id af79cd13be357-8cd80f1fa47mr676077185a.41.1773053825036;
        Mon, 09 Mar 2026 03:57:05 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm26169971f8f.13.2026.03.09.03.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:57:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 12:56:53 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-dts-qcom-glymur-add-usb-support-v4-3-6bdc41f58d18@oss.qualcomm.com>
References: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
In-Reply-To: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=5710;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CNWJ3/c1pFSbapFO5cM20W5qxEdXJ/MrU22CBbXDnf4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprqd45buqz9CCGaqFdjlF8e2kh2lLTfndji1ta
 zFc5ScrXbmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6neAAKCRAbX0TJAJUV
 VohYD/4/kQ44Fe6os7zuih6UbvT0U36VR3ddyE08cQ/UvQs3nwziRGZFiCvQiELBN4yxO8gvSPV
 VgeJeKGFGPokPuIHSZccwzBSPlbfdk6uE9iALwhKts7nlpZ9hAqecm0+YRk1l75X017VzSxr3Fl
 FxuCfx0GyL32Tt+WV+lUC7qtt4UsFwemZBhNsfLhx5GK/MREf8oLHfBmNNETj59a600hyGgB4Te
 VccELy98kwJI2Y/Tva2MfS0EaJlLVjhwMhF3dtDMUCmMhBSGbJQHNLueJOvtXqjJOygSh04beE1
 JxD5FoqgMp3eUjK2k1iM55jLbxGa4HgtOBCLYQy1gNp+2TL9Jgy4/H5ybsmihJh1CMJuzao3OIY
 pzOvBugZvwQn7C6rAtb27Wnlmp3cVA5M4t3CBIHx2yKFALOSAycr0+4aCZVnclpbJ7tyQlqSZlw
 oUQD7YyGEy/oTywpcfkP8Q2eqq6BvpoU4HnnknANK5235zO3V9q21c8stHD0XBg3rsLNSnOI9SL
 eaQYTwHSNWDcVVHJ+MfgIMeYc2Pemd6DzuHqGpF3gZ3bA8diE4FrvEtXY3NDS4B7ekGFJ2bW0Nr
 X5uUHlAf9Uo52qhQzVW7RSvjQC9AT9hiXJ7wZtxJCJBmmWxVkwL/SM4jQCKyoM5Ulf/mPPrrNZx
 ZC1iLii6QLcjCew==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69aea782 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=90PFzFbqMbmzgoUh7Q0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMCBTYWx0ZWRfX0Kc6CHMzGLJy
 l1j5nS1q5jlpauhh3L3pJl3Wupmrd4VimsfbNS8akFiSCexJV4HnYL3j0Hx7UbxM9lbu42bJIYa
 PVCf6hB5iL3j71ygrgcKECcLZOEyg9K88M/Vpcc6GMpW0b+t6E5BdcGpzIZt+zLs5nvidLU7Rpu
 WN5lK6ZIKdcd75HHvaR6H+lahuTTGH/WwaunFUfDPjBfI8s6g1HeGfbYwJwmflGC68pxWWBiGby
 IjrXlAkAS/Bx8Avng+q5WpHOC7UizLtKEtUSypG1qvalCU5Dxs80nczuL6Kcm2WIv/SZMfVxAlV
 UE6v8RNmfoqGWFvcNhj8JVoU2lsFrhRDVPASdpy97DnK1IYTz6d0IFzwNdidMPbYEHHrXw/EH3d
 sQYk2bzwgDtcr+XL87YU3OC6hLTGZdFMaiHNPVGJmO2oSDoQzvoaO68W8c4/lK9b5j51zW4vaQd
 ClUk4iHeSIqXsNTKlVg==
X-Proofpoint-ORIG-GUID: ooV18qBuZiWoCWz-Kz2YdJZvKGab3rJi
X-Proofpoint-GUID: ooV18qBuZiWoCWz-Kz2YdJZvKGab3rJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090100
X-Rspamd-Queue-Id: 369822377EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96207-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.43:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.47:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

The Qualcomm Glymur Compute Reference Device comes with 2 Type-C ports,
one USB Type-A, and a fingerprint reader connected over USB. Each of these
2 Type-C ports are connected to one of the USB combo PHYs and one of the
M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
via one of the M31 eUSB2 PHYs and one USB3 UNI PHY. The fingerprint reader
is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
eUSB2 to USB 2.0 repeaters, which are either part of SMB2370 PMICs or
dedicated NXP PTN3222.

So enable all needed controllers, PHYs and repeaters, while describing
their supplies. Also describe the PMIC glink graph for Type-C connectors.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 214 ++++++++++++++++++++++++++++++++
 1 file changed, 214 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..a7b30accbd1e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -60,6 +60,69 @@ key-volume-up {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -367,6 +430,36 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222_0: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_1: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -485,6 +578,16 @@ &pon_resin {
 	status = "okay";
 };
 
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -596,3 +699,114 @@ wwan_reg_en: wwan-reg-en-state {
 		bias-disable;
 	};
 };
+
+&usb_0 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_hs {
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_1>;
+
+	status = "okay";
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

-- 
2.48.1



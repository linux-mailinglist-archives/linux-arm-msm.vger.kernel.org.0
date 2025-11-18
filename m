Return-Path: <linux-arm-msm+bounces-82321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B40C69D6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E4024F5076
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB3E31280D;
	Tue, 18 Nov 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AolraFiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dv3f7mji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66B2FF15B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474658; cv=none; b=OBzDKFtFIN0d/zR/1lW7JdrqqwCyW1vn/O+timUypT07E+E7meUnlSECtIda4HObsSFBe5kjQkUbnQcXurfZ3OzuelYV5k+REYAqsgKlDhMTkydEpVusoZwdjyxR0epDgHzrlTN/V+JAZuxjLHDxcIzuGN6NA3JKs30JgdQLYJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474658; c=relaxed/simple;
	bh=eivKH+bThhHIx+nrmAYaplfsILqcdjKBqOGsG4tirSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UqmKCiqP5fJYnAA2jrULXIuuRNVlDPRkxlwaPPaAkEptzGI83goOm8pjtpLQDVBNtPwoMK5inSsePj/Tx5Cd4JOwvPocj5gZcNQAocHU73nfVBvRNvGit5tCqO67jYoIzauPhEdLRP5wTr/pHjA/PX0QLPXXNbA/BfpDS4WvMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AolraFiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dv3f7mji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICAv0c2802561
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uHYxjskzaDZ3AQkqslYYhIoAw46gvy8EwCz
	PW9HpHgs=; b=AolraFiuPA7eUxSVtzIAj4acCUraUB6bbMifssolfSyqkH0oTxt
	TtDca6p3ZHoUOI2Svj1XcBaMx41Qy5Q0bpFZIxL4StPEE2VXg7xaS7GkfaAnObPB
	JAce0/UlUT+4K+i4I9zaQz61UT+AgqIRjedSbCJWr+2QuVAkxmbNbiaZQMTj0/jI
	S1jGPfl+msABvW9zt0/eAJuXFY72Gq1EHFdw5i/ua4TkBvxfsWLMT+/7ibsK3Trs
	JVSvadurBPlW0ZiISgbn1rZD8SRoQg2S1JSziF+KYgClKbO0Eo6WfH3XVHs3P27W
	3e9LThnqaLcqWcbjEnZWUuIABkoBWFjlWyg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk20957-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295ac7012acso23739915ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763474654; x=1764079454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHYxjskzaDZ3AQkqslYYhIoAw46gvy8EwCzPW9HpHgs=;
        b=dv3f7mjiXVN8XtrgBNO93r15znCXik49/uSZd1/WdHS7bBo/zY70a7eQzKFeUbg28N
         r2ll3tY+fRVQj31bDMsbNLogicuYagS/D+mX0cJBbtzNUa3LG9yLRZEESj9s3U+niVUs
         iVCSpJ8DdTo+aux7eGEs6Nx1VEj7liDXt9DGgdMrXedU7W1VsdZE12Ecxq53AxdnICPV
         qCYSh4Z9gWEEW7KqkuumJNYtPAFtbFGj8rTtpKAM7eBszVnXD/o5gdR6+cjJjauXtqaL
         zkyZ7lL90WoOwV79XQNoq7aeSiMxoyv7KrgjD8iQQwqiFo0mh1gkCiwST/8R8/qqfYkx
         eLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474654; x=1764079454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHYxjskzaDZ3AQkqslYYhIoAw46gvy8EwCzPW9HpHgs=;
        b=Ap4CGOM6d8OZhQ0sgoaLpYhGpCZURcgErksLNLmLWaGaeYePCdiz8NZhuezf0PULxX
         eRZR6AUNElOJ2Tij1pZN9/C3Ck04pofSIGPKtihfzqaH8KM5FLITIKbAgZ4WzQ7y+bqH
         GWGG69svYcbJcjl1rD9RJERl5iw7ArWPfY9o/+BHmhzZvIQgMooD2z6LjeH7XjRebB7R
         vhCwDXP0foJhM0jK/2ZGxokxUsvlGj3BEEmBNy9IbDbu6R0GgLujldAGUZN6xkeP9KaN
         fPzeDOj0B5Pr3kF54TKYE8ZR+8OoLMjvxHzofNdVdftXkDxVXA/4a98Mq7sfarLQV9pf
         XuoA==
X-Gm-Message-State: AOJu0Yz8rlcw766Sbe+mXMxzCQ3pqr5JoIl/9rrl7V0KftqhyRhwjOA1
	b2W289yDRIXDTbUhQK6ua9+2ad0OvY7GbFNjRr0dx3Juw/fmbjS01gwBEQHvvFyj1NkJAaXsKtr
	NdMJnZHyCk5XfmrNWQd9EAe8lqANj6W5uGbPltJT6GCuK24+wrlWNJ4yU4IUiCYbXnnIy
X-Gm-Gg: ASbGnctLOK6LnbsXHY5n4Em8A4q1sd4WixYKfBQleXpfHK5jSMY0049UDw3x0/Xzju8
	hzBLPzA1/no4i4GCzRaDr24MoUDkrj0LXFDXtlCR0vNZNnHJEq5KGxUWy1mLpd+m1acbm2xSDo7
	NtzPaFO3eFL7luG0lRmHeytmG0GoO5+YaF4kXiz79nKrWOoNhlEl/9N57T8NuE8g8ULTlmUO9D4
	6DHoqWc+rermN+ogmSremB/yzl9sPvqPghuG1Oa95EFwDYaV2GZVAbRYSrF+ZzJJq0x//nxuFig
	jqK7PTYOHJtkz7WfKm6IvVMpKADUJpHKaCQF42fji6A++OL9imLyEahdIEMi2kCA3rl9hpqb/S8
	Pa4/A+41qLUFuymIYGyjaIJUrDXCK46NG
X-Received: by 2002:a17:902:c404:b0:298:5eb6:8998 with SMTP id d9443c01a7336-299f655aa90mr19058135ad.3.1763474653892;
        Tue, 18 Nov 2025 06:04:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMG1GyA9Vp3dG2icF2IS9EZgNfW2wZwVLWZrzxeSFWMbHaFtQD3m0nI6ncFpQuuS5iZ4Yw7Q==
X-Received: by 2002:a17:902:c404:b0:298:5eb6:8998 with SMTP id d9443c01a7336-299f655aa90mr19057645ad.3.1763474653120;
        Tue, 18 Nov 2025 06:04:13 -0800 (PST)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm142957695ad.79.2025.11.18.06.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:04:12 -0800 (PST)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, quic_shuaz@quicinc.com
Subject: [PATCH V2 0/1] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
Date: Tue, 18 Nov 2025 19:34:05 +0530
Message-Id: <20251118140406.1551669-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c7cdf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R7mCYRQwjcki8tQcZRYA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Vu8eAcZtnuXSitQKgx3orzPuFOIYrNSM
X-Proofpoint-ORIG-GUID: Vu8eAcZtnuXSitQKgx3orzPuFOIYrNSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMyBTYWx0ZWRfX43lx9HvADmmy
 Bh7szIkMiLivB+hgPqzlnFQIxgnGrW6SGXkTplellt8jg9p61aXXAmb2ZO3r21r1u8uIAGcYZcm
 7tXpygLkr3c9HeNqfUknZVo97vmRvgvHemBXmXUzqOJLXDUoUIiqFzDE+PldRdq+PCGhHClkuGg
 +XrlebMXflQgFuc6jAroTJfhUV3+ietl9BsgGdKAx7aQaWi+mHPDOE8F0z3Y7DcxZz0z0Z0EtUT
 RLtLoXwQ2VVLK/NEZ6slaq+zWYAkLoEWAaloPCLl29bvYZq253TPL0zHmyfpfnyrL/HWo5xPpvP
 uu4WQAJ0fnaS+64DoPVH4NyyVTLBAqfF0+Q0X4euCT58helrFwjBCxQtIaBZsgbUelV2cckOu2Q
 czY7NLYv/Xs2TQ/l7AE2JO+yPBrqQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180113

Changes for v2
- Update commit message, add firmware name detail
- Reorganize patchset
- V1 link
  https://lore.kernel.org/all/20251113130942.2661069-1-wei.deng@oss.qualcomm.com/

Wei Deng (1):
  arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)


base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
prerequisite-patch-id: babbcf9dd8722e19d91b01eb45756f58e58ba6ac
prerequisite-patch-id: e641f09d4139ac77c34757bd08af2db746de3963
prerequisite-patch-id: f5dd3ee9979e2a049badfb51cfab184da4501870
prerequisite-patch-id: 40187dae2c9518a10866104b9fcd5a481ac67d51
prerequisite-patch-id: b9a2e071f5ddcc70dbd6addcbf738afdc9283cdc
-- 
2.25.1



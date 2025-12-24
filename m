Return-Path: <linux-arm-msm+bounces-86473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CDCCDB5FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8309A300DC83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 05:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183B4329E5D;
	Wed, 24 Dec 2025 05:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJY+6/3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsrgvUF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D02D94BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766553198; cv=none; b=Hve+/iO7RvbR8P5D4mAtdlGvuSn0EntdtY+DrnlKm0DisWRzkakLdkQ8AqKEVZmmmWDzyHris7e9GrHGqYUg2icTvfNhEx8nf525nw13wN2yVegI/KR53g/sfd2gpTUNo1Ym7+3l5kSd5nSrIgS/PlQ8gBBmCjyJHbhoKVaC7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766553198; c=relaxed/simple;
	bh=AmcyP/+YXSCcHKikxMnVGBA+e4Bz46fLGunmefIhtz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g+ycORF4oOF/UyWJ8BKXTqwXsozENszZca6v9L1c14AxtHHOFq0Yz2NixT1yttkmPp9dg0aZHEtEH9RzsezGZI0NWfOBLZyxw8IuTH/shDW8nirpGEE01qqgpAJ/4ti9FE6LmICUc9sZE1sactfMtE/Q/G/Itew8Sj75Dks7p8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJY+6/3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsrgvUF3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGOGSk1018267
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 05:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UNg2g4sJcl7CEJLjxJq/A/18qedgH/ARFWQ5YzTQ5dk=; b=pJY+6/3DNpUpw4uk
	xuMvxMHQy9W+uCHPSDm2Hi9XlrlzpMuTSzvC23LtzmvN3UyBQ0p1fLuLqe0PPorI
	q07HAaJ0qtP/lOwnn3JcFv+sZVvEfMD2z5jkQIFf5prO12eIQ9b1VU2h0BLI0psk
	aWVbs5N9s6+lsYwIiZJw7+QiQzhXw2wJaPxPpI1MlI0nJ30bsc4NOqiCUqieAuad
	GdqWzSDeVzx5hfpq9pD6DJMdfImbo8BC0WTDwItiePHvCOuza8eN7bCkxDWuNccJ
	Jc7D1S+e/p2i5JxQffuD+h9kHQlAYo8WSv7w5poQg68UVX+/PusBxM7JE9BEnh52
	T5z4+g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9u5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 05:13:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f8e6a5de4so77454995ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 21:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766553194; x=1767157994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNg2g4sJcl7CEJLjxJq/A/18qedgH/ARFWQ5YzTQ5dk=;
        b=QsrgvUF3JowbGJi7Wed1nlg40FSL4vazKCQraXkzh/NKc37Y2vBjNsqmjUc9sNglyw
         Exs1JrnS/DOOSveko7uGlaUDYbqYHS2wtqut/tucOtoLD6yTHKnDAQSBXLuYVc23hRdn
         NYrKmQ4YQpy4mSgBMpBjqwi94uJizl/8mgBMB9cIeM0cAe0cIfIfQEAZCnpVbvBB8XCl
         K3Phc6EF01elwytZnQCwb4cjpUoufx88CitppKyaBYTMwu5/OYR3sI9tQt8UQI13t4sI
         sJfsVrwDmHiVQQus8VOp4AOSb3znXB+1iNgfOr+tIGqiuZwTurwUCE5U5m2S0S5l4GAv
         yuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766553194; x=1767157994;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNg2g4sJcl7CEJLjxJq/A/18qedgH/ARFWQ5YzTQ5dk=;
        b=romszHgO+2p/TkIh5JltNSwp8/TRZXSglpdMz+Z6pjpqZSFPkFLvAom2Ijk1+iPlg2
         YRcLNxBK2KMBgI3UGHhYkp5aVYMPZ417OmJsl3FMea7l0dACnnECt7P664TZG5uU2h8p
         MLLRoFG6xtZZo4fLCsjEgaoDykzA4OMhK0VplIblLRhqhBs74KK9r0/QrIkf67t2hq57
         P0zokoMMunLVLmDXQhC7uTucJxnx4uXmSdrIQpud+HdCFifuidXiFrfHZ1EmDrVIzJYB
         AMWzPiETI2R4On/XCQSdQeJnxS2XDBmF3DYHYh5uUpAgbAq98Hk92h+o5j5BZvC0RoBP
         LMMw==
X-Forwarded-Encrypted: i=1; AJvYcCXAnlaQpQRa8dhgPqLL4UCnh9wHaBCEXEHgqeaXKjhFWXWnLwmwryfOsc/PYRNMdvWv1nnnwbNIUfGDRiH1@vger.kernel.org
X-Gm-Message-State: AOJu0YwOO+Gmfyf03Az8zLl/yTYbs4UyaFnnhmTODrcmJ8qCmvvrehad
	645aOu8XDLHw9hOaWPj0W5iux+Xx2ryHSU2qHdDY6v9NoG1iIlbZhbBPRy5iFpGywiwgFnd+V5F
	lP2nJgC40HytQWxMqUHu8DgVHCKQHlcoOgVMOsBmRpdwmZcdtcdA33b7YzYdR+dGgVqk4
X-Gm-Gg: AY/fxX5SkxQtZBMH1RNShj/6xFHF4jKJF4eaQnHAy+YKY+/dx44yrFD88ZXPYGZUuRB
	C8hENfZON3392KRzEtmZT/ZPO0UIEK/OiMPjlynaqXs2lyNLSJXhQhzhCaiiNdTKblLSu3yRNuV
	w6FKGOwexl4CIpsEr8jMHMwRI2vlcsaPdagr+xvnR0Kr7b8nWUNGPHnHBLk+8xYxlpqryl+bOzM
	f3OlGsi0NBb8MhH5ZXynojcTH+CqYLkQO0r/zeBps4qo//JAHlsaA1tgKyNTq+dwJOfNAZQkInC
	Zb9FZ+L+m0E1qMtyEJk4LPEXN9GkH39/YRqYIjuNe4D81y5mWAMsYDJXYR5hodiB1Kcd4lOPikh
	7qElxnrT5+v+mVT8t31D7iDpkZK/Lk9pYDALxM8+j
X-Received: by 2002:a17:903:19c8:b0:2a0:be68:9457 with SMTP id d9443c01a7336-2a2f2a34f96mr147292055ad.44.1766553194405;
        Tue, 23 Dec 2025 21:13:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjImWTzVXni9uo6xBuyndgwIbfmnboPlYngHRaM9Yr+XDGTGMMtl2apXU6Icj8XduLiszmwQ==
X-Received: by 2002:a17:903:19c8:b0:2a0:be68:9457 with SMTP id d9443c01a7336-2a2f2a34f96mr147291835ad.44.1766553193911;
        Tue, 23 Dec 2025 21:13:13 -0800 (PST)
Received: from [192.168.1.102] ([120.56.200.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d407sm141763555ad.72.2025.12.23.21.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 21:13:13 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251223-wlan_image_load_skip_512k-v5-1-8d4459d720b5@oss.qualcomm.com>
References: <20251223-wlan_image_load_skip_512k-v5-1-8d4459d720b5@oss.qualcomm.com>
Subject: Re: [PATCH v5] mhi: host: Add support for dual ELF image format
Message-Id: <176655319182.6748.16911580360002746878.b4-ty@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 10:43:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA0MSBTYWx0ZWRfX5nD4Je0JO+Tt
 UzrcCCNqWLyoseAXl8p4qd6c7JamQ0i1q1GpbIgnTyDKhbOaaPADMnQ0r2DceNxp5zrMWTJCIVM
 o3INLO3KlufzQBnBoVJc+mH702zgLqjrDJy0KmOtSQF9h2CLlm04lR64dwonANeJuKBhZIaGYWM
 Hj4MM2DfqhtknFJfaWzmNNUSDVk65ik0kuvK7NLc3cqV8TpJkoS8CuGJyzVO6aZCgQDS5sPMvmo
 2Pk89BSEc9Es3ZV+KkMQZVnFzTACY5sDT5iRHIADI0X+LIVSnMct1zSQym6UVPfqCMLMeFVOdyd
 1rgn6bYFI7rDrh4GMBL+S1YHLQk9wOWHmZT9ZirVoiGCcegirEnk3+H6lzvBjhLmUqfXXvnlTeM
 bEe6r6Lv3ALc56tXGkGgnxQ1kPtYrZ0JzSCth2qArsVRLYMDiAvnuWbBYQAcqhHFE1vbVon7DJb
 KD8/Vzh4OqYd4bSWzYQ==
X-Proofpoint-ORIG-GUID: MCI9727tEBylZn-sXExy0WI-dht2s2nV
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b766b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=31AEnvkI3DvSdtIumApubw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nt1Z7yP7Ej6Vv7KpVVcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: MCI9727tEBylZn-sXExy0WI-dht2s2nV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240041


On Tue, 23 Dec 2025 19:05:26 -0800, Qiang Yu wrote:
> Currently, the FBC image contains a single ELF header followed by segments
> for both SBL and WLAN FW. However, TME-L (Trust Management Engine Lite)
> supported devices (e.g., QCC2072) require separate ELF headers for SBL and
> WLAN FW segments due to TME-L image authentication requirements.
> 
> Current image format contains two sections in a single binary:
> - First 512KB: ELF header + SBL segments
> - Remaining: WLAN FW segments (raw data)
> 
> [...]

Applied, thanks!

[1/1] mhi: host: Add support for dual ELF image format
      commit: 820c866c42de99e7d65c7bd1f591f067dbbe3cae

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



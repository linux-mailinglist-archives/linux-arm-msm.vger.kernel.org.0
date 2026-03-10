Return-Path: <linux-arm-msm+bounces-96584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALWvBKLur2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:12:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F07B2492E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD2F23067425
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9E6439005;
	Tue, 10 Mar 2026 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hutv5ZZo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvqaLBfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B42AD3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137413; cv=none; b=cHG1uQXhJdnPksdgQBvZlyxmdAbR4RRdhAWS4LNcfZk8i3tACBKuVQ+MutkX6Dcc+JwgUILX5o0lq6EBBFqlwkbikhlNVgso5HKkSRz4GSWOMCr2HmfaQRleMxGg8PcCCV4mfSPIRVjcEXENUKblN7KgLEFFn60HnEs34XiAbfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137413; c=relaxed/simple;
	bh=c0uB+R9XSeasPCGSinKYnBYnx+NTByhX8d/46jPy+B0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cpLP2A1/AObDCqn7XWXGGiTPNjorW+Ev81klDH5AMUkHw76fIwzfeY1ZgtRv2oKQGLmMW1EjNlKzcRVzd+qIQJiNGi2xvRQqHcsStqv3gISoH02cVoEUwwEcOC/HH7Msl1nRz4vvdRjNH/Uuz/tiHS+ZapVihCwiTOYKLzbixJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hutv5ZZo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvqaLBfC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A91eKd2363185
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rBsYS1XgomXiC4B7AtiRr2
	PaxpFmdm9YeGDDbCHnisw=; b=Hutv5ZZozwezcMGIT9svXArFtRjmvDDocpKpqu
	UpFSYa1sxcxwYd6k4RsYz1hmyPfsYU+Mjpwd29RKKiQd6NME0bdlvhIe7sENaDvv
	2lWUYee1pbo5+RIjS9r3i3CTDwkH4VtLA5JKtugsetGZc+PF7BvRtdHkYtp90RsO
	D1s4yxzwXEmIrWybiX+pXEUYUQnNpmUbubwrXLPwyQExJUeLrzjguIhMN7zP2Kpj
	8VUHhFRuy6Jaj8Nf4shDG33LSBcSrTb2kP8H98I1n0uGYOEvuR5AqinYQJ5/2vBN
	aDjquEL4qUzumGnoIvjNChpwN68W4f1CgNH3PE+K5N5pVZGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032bpab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd83cfb36cso1577528685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137410; x=1773742210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBsYS1XgomXiC4B7AtiRr2PaxpFmdm9YeGDDbCHnisw=;
        b=HvqaLBfCM9Zahl+hkC6rf8KQc1/c1RD41G/Xmn2YNAUuxHPgCY+Z1LCaCaGUz7aPX7
         riaEer1TBT0j9iFDXHH+R0V1VsiRWAWAjFLuytbvG0s+HcxprKiYWOFzR+ej5ab6IMWg
         kDGT2WppPxD8rHTRP5X/w6nak5gCgiGpCOjNMXXN3Q/lQbhZJuqlxNcYhB8cezLqeqjk
         DSt2KGX0fcI5KnIvTs9lwnQVxJXHhkwePgzg+549mGiqqPNmbF3AZrmnQQEDnLhxBN1E
         lEOqlpykrTgK1w/b8AuRaJTdqN+fMQCSanuu/Rxc2esX7q/QCogl+9gmaZ27hRGEgPfN
         omiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137410; x=1773742210;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBsYS1XgomXiC4B7AtiRr2PaxpFmdm9YeGDDbCHnisw=;
        b=IOFboWAp+otOkQHRHJI7OUPEeUyiIpTaiiAL64QmxO/mDAIekAydr2Jj0VKMuASp5o
         oy/BKTxkRHg/lTRyDtgRANoiQ1rfdnroP4H+nOR6x0HpPAL+E1Pe6duwlfhJ0xvn+alp
         +TTBtwY+hXACq3HW1kRVLFk70UW2caYfKGoALfQgCVEqNs8avvwc8bd31KZvHsdKjQl3
         zeo41yLi/YH0QCcnnWzxSgBKK2p8NuWZW9z3p+kvuzlubjAZcbXq+FnKsJvIiDXytlHI
         vKeUrZe4F1xhuM+OIgkam4knkb2x0keEkpC/6LPNNrnhcS2Ln+CEw3hCVuo0WlLXYV+Z
         mKHg==
X-Gm-Message-State: AOJu0YyZrsDac6qn/K6KUVuEKUMC6NJZbciLK5hC/owmNy5q+3P+9dnA
	YP63E5kMoi9QRxpYQldhpdWG9whIYlWU5ohHY/vj8FZhTMkLkHyP6dM05Oyxda7s3f5/ak/VAOt
	9BRjHI2l5P/q2TNlQbLyD3WCo1ESA3wTj9+gCi1wNyLOe0NkL9vL+maQhnbwYuPHFpeBC
X-Gm-Gg: ATEYQzwAI7ydBNoCJaFKxgZHWBkzWCZcnlLJjVPWlxLd2zQBscSevYaywq4CVqg3Ji4
	FfjvF1uDQYX7zRtKy+DXojpYiMgCVE5oNDEigO9YAuRXFXAlIyGYJKmsnwirteMYa0ZHCg5eXrZ
	oYJdWAdpTpE6ZlaS34eVRpxWXbX7VC6VUXyXSP4IeSItj+K8+7eBLIvre9aEItTURUDwFCXLeWj
	oufHqzKJERRlr+Ih9fo23tJVdCJtxSqqE3wmnYcVJesVKtC51v+fzUDgDF4zFaXgyCr0CQRrPOt
	jvgE1K2/+o7zy0Key9XHxlPIGIavgdxIjwSlB2TdKemSZwh05pK6n3d8FwUelXUJDec+ZJYegXh
	bQ2BepsIeVhs12SiKeH4Farrer0SFktJT2NuLXVmNOtww
X-Received: by 2002:a05:620a:40c3:b0:8cd:8d79:6c6e with SMTP id af79cd13be357-8cd8d796ec3mr668607185a.69.1773137410064;
        Tue, 10 Mar 2026 03:10:10 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:8cd:8d79:6c6e with SMTP id af79cd13be357-8cd8d796ec3mr668590885a.69.1773137407825;
        Tue, 10 Mar 2026 03:10:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a7f182sm87703575e9.5.2026.03.10.03.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:10:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RESEND v4 0/4] arm64: dts: qcom: sm8750: Enable display
Date: Tue, 10 Mar 2026 11:09:47 +0100
Message-Id: <20260310-sm8750-display-dts-v4-0-d571a786bb70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvtr2kC/33OsW7DIBAG4FeJmIsFx9ngThmaNUM6Vh0IhgTJN
 gk4VqPI715qq+1Qq8tJd6f7/nuQZKO3iTxvHiTa0Scf+tzg04aYs+5Plvom9wQYlAwBaeqULBl
 tfLq0+k6bIVFEiVJoIZxzJB9eonX+Y0bfyGH3utu/kPdlHu31ljOGZfk1PPs0hHifHxj5fPJf1
 sgpo5U7Ahhdl06obet7HUMR4mkOGeHH4JzDqgHZaHhZSVMqoYD/McSvAbxaNUQ2hFK1NhacY8d
 tSKm43nRrQtcVuSwSfksVA65WJcwSlyhsrVCpClekaZo+AQVx8Y+qAQAA
X-Change-ID: 20250424-sm8750-display-dts-447473a33fff
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c0uB+R9XSeasPCGSinKYnBYnx+NTByhX8d/46jPy+B0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr+33bEGu4OmZer8tAebYoMqKTsJB2J8+ik1G5
 ynoh6gnk6WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/t9wAKCRDBN2bmhouD
 10cMD/0Wl+hh/d1cUrVNAIluJQkSZTZDRCeD5+IPf5gsVDhBA2e0JJrWTJPP8X9wvHKAALXxGH0
 4Ar2aUuY15zRU27G5mdWShWIVT9rZ4DH7sJRdjnxlS+IrJDxSYIEuR1vZjogckBIhIO3NDBdEP3
 wBm4xSku6/sxFuyv6YwG1mo0B1r7MwG8vuk/m6B9z4jOmH/bPpR3Orkqf5O8OpXSptE/dqzVDKQ
 bd4zZMkucKuIQ9klWNjbb8mtQUIKosPslWLIiXWS8rx9vw/nvif1lMeGt2OUIkND98U0HGwY7GU
 1UyG0EgOETDbRbUcPbt3dYAt2iWtOeNkDa6LPETswCKp3efK05RXXy/pQfNw1QaZGWgGzx1yEZr
 NEEPkKsKTzqot2+GO0uH8fbkdqAWnCnIW65LRJTdjxFLAi0hMXAE6NwkPRuaNh5+kdznSTn1Ppa
 Tuhaxt37vBCt753qSAVO46eWUl9pBfHeB/VBd1XrmhKTVYlbM9vp2qg9nc1Xm9gd2BixCtRxqtY
 mw6DSR+qkASFdaIM7iKtceVq57iPBFufJQRSMxlqFT6OFE6lTEAm7UL64j/Q/AjzBQ6lHjoMqG7
 eBCkkGCMfwmtHkZRyiJK7NmTBX43U6GRRhgEWmd/3PGtrvFEnX/GXQe5zP+AOBWUxjw7MGgnL1U
 Q8uETpbbY/vfpQA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NyBTYWx0ZWRfX7zDLwgKqMzkx
 004qkegA1SFsS/TENut43qe9rFsSCH6OgkkABTWPLn+a0QdnLftEIdvhaFVO8kJRBLFZzsmHeCu
 /jdO4/HZpyboiKBxXboH4946zS0H4EQ7bGizXoP8jLoNqPHbpL4ErrFaDKqGx4T7zDt2ixSTsMy
 cZNdbZUH/ZHnkkT3WCwt1pqyzKXnkuhVniB8ZC4mYIjqBBgN4BVU9oqP0DLPb2pla/VR6k8tw+q
 WIoKQnvaw4CiUAtKfAq1B08Q/OROOeNVnnLt2IIOzFvEaoGDJ+bb/ue/CMt+j7IA9Un2pFfbZzs
 wSRiXaEnee4bK1jx3lBehfZCf/3thdHC3jtSRh6WvqE+kFRHikxw0j9oZjB069VOPkEtZJjKiJv
 q2X/JcKAgtYYgpP1ihY8XH2q2rdrZUXMONgKtKmJo4wYavfsUVtHX+oGJRfkLzarY9ECkBgaxOk
 7mOu0wio8L1CiEqupKg==
X-Proofpoint-ORIG-GUID: VyOauPwVp40k1VTNCqAsjPsukCL7Y9qe
X-Proofpoint-GUID: VyOauPwVp40k1VTNCqAsjPsukCL7Y9qe
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afee03 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=9R8VuvqHf2Z2bX_J5xIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100087
X-Rspamd-Queue-Id: 5F07B2492E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-96584-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Resent with some tags added (but not half-done reviews - please ack
patches if you do not intend to actually review them)
- Link to v4: https://patch.msgid.link/20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com

Changes in v4:
- Add tags, rebase (context changes)
- altmode->accessory mode (Dmitry)
- Drop redundant TE mdp_sync pin state (Dmitry)
- Link to v3: https://patch.msgid.link/20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com

Changes in v3:
- Rebase, add Rb tags
- Patch #3: Add link-frequencies as Konrad Suggested
- Link to v2: https://patch.msgid.link/20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org

Changes in v2:
- Add Rb tags
- Re-order nodes/sort by unit address
- Add low_svs_d1 opps for DSI and DPU
- Add DP Pixel1 clock (they were added to other targets as well, also
  Abel pointed it out)
- Some context changes due to dependency changes/merging
- Link to v1: https://lore.kernel.org/r/20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org

All dependencies, including bindings, were merged, so this can be applied.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
      arm64: dts: qcom: sm8750-mtp: Enable display
      arm64: dts: qcom: sm8750-mtp: Enable USB headset and Type-C accessory mode
      arm64: dts: qcom: sm8750-mtp: Enable DisplayPort over USB

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 122 +++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 439 ++++++++++++++++++++++++++++++++
 2 files changed, 561 insertions(+)
---
base-commit: c421ee9ddcd27288af275c1b185aa4c86eea9b9e
change-id: 20250424-sm8750-display-dts-447473a33fff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>



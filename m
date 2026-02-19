Return-Path: <linux-arm-msm+bounces-93359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPKxCjDblmlJpgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:43:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CF915D75B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33F830A3016
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A140D328B5C;
	Thu, 19 Feb 2026 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p71bUXtS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjNZ7yKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67983145FE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771493985; cv=none; b=bUTx3iJI8oETNevn9f7Ve/IpxQuMWKeo9gXJCYRay8JODtwkhTs/E57j/tA4CsNtpEppnb+O/cUawjyUdNKEebN8x1B+4yAvlvUhvqsfSzgEpCVe3zL+sGO/Il+4C9999IylQkv+wvuw2XnZ07lA+g+eyV0HRlgQesdEfj4aggU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771493985; c=relaxed/simple;
	bh=xwCDUg2ytKuLG2nrJFZ2VDmvgWXuCeD1FC2O5By5Gy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utIG6Id96mX2Doq9VHZoN9+3UZj0oR+cw7/QU42FRHthgEKwyb5Q89O+7Ei5WWnYowrqqfwXSoOQdycA8Zxh72wnbhp67/uGN99WNbfZAcN6ZSPaNYKJH2zGzH0ToXSOhnqkHwexb+tK5HeBjWU6eiBLFd9zLjvtf1z7TGt7mPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p71bUXtS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjNZ7yKz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J18JkU3077995
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4b+6NzjTwARn2L0teShlEhfaZaMG9S6fCU77Gr+qQw=; b=p71bUXtS5RXb4gjl
	SILk8jyDIeVjt4XEInzLeoZzkb1gz+5sgromrK0WJ7MtmgWP83+/FKRtLBK9+/O4
	bbaPl5MbEJrzXKQYYjk9DrN0lrpksWtJW++6VL2qGmM1q5KQ5G+2a+qx8wjBJca8
	og3NX0E+4mQ6Kp3Y+j99K7mNjYWAPi7V+jWkEwgDGz6C3BFpT1JZ15+T+M9/iZuq
	MOnzzRnfJSq595JHzGO6P8cuLnHF8r2GKxsmikJzXBRlOuj/zRGWj6bhwn/SmUUp
	dvnRIb0HioGBg6n1q8nP5A2G4CRvFOPJrqDWo2hS0+9Y4twKmyxtBzvskHgDQytl
	xz3X0A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk80yyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8243a06b397so432873b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771493982; x=1772098782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4b+6NzjTwARn2L0teShlEhfaZaMG9S6fCU77Gr+qQw=;
        b=FjNZ7yKzmnuOvIUlIA82fASNg2ZBTunLMnRuQKElYbc43z+qge50AzH1NOaavh3mfR
         jl+CHvr4aV1cyYS1Xn9f96q0YFFBeZc8yWOXqqVPIZO7hRQSgeDAv0XZFjAtd4OL982M
         kM8S4F8mGLPvctNcVZ/sOy76R9oQlt9IdL/iN25e/MXGqLrHbpEf9I3ZaONjLSZ4H0Dp
         DRtkQnlbiV3kcyhMGnUP17X7JL7JttiSsRogdA2UPeKCcYo8IDpOREmUfECUzNIT+Rfn
         +kTrMMcJJ8D5GE0/cJlWzhQOvEDAndEeAkynnQ3u7QYckmdt+goYVEwo8jH81UGwqj7n
         sE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771493982; x=1772098782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U4b+6NzjTwARn2L0teShlEhfaZaMG9S6fCU77Gr+qQw=;
        b=mJPiveB/l1t6NExQLQGTBqN+btEDGoJJ6shzxN6a1iCelBMZgW9GoOPlO4G4MeOiOl
         VzsyO4F6Mx/SW/cktH+JcnI0i+8hGkmTIEZcP5sLN+EYmTPxsFiZpPy87AlCcYpEU5XU
         PgqqrwPbVw4NLTc+n/LlIxBwVEux50nGEkDuN8yV7tLDIgLdjw6bzasGiG9uxL2jCx5s
         38S9XXnKuUB1p+/kns1Py6X81v2jGSj5JiqHBO1tqxSCJqNaGI6Ke0COBCUCBmEzPFQ4
         TR1n5TBo2CnTn+ipTeitag2ZCzvEQ5acQskfG0+nsyFo4dgZkOxvv1qtqcCz20z3fSHc
         g8Jw==
X-Gm-Message-State: AOJu0Yy1/k62jgQ1VPnPADVrkW2py7beBNPnYEmFMy5t/gYO4BBtSnTA
	nzimcl8HYk9a8mCeNzftxe3dV9O4Nh7YS+HGqK+mnJyuebzYKtuPavnVpX+WzBpaVTgmooho1x2
	6BrF9Ouz0QALvxuTRk4nVWyZpPre459nGQ3WgQXDEHw8dpCf0r8LEdVW+RZv+nvXgLonM
X-Gm-Gg: AZuq6aImiLDe+FScmcXdLZn7s5iT3mpRj4Q4DDaHDB2ZxDvYFI77+A/3/SrsaQJo0Tg
	6Lj+CLkniPKJbt4qhCKWWx0LVkXaA0mp9cfnemBEW+egAUynlkk/YK6Gmc7o1iHjOqn1HOwLrMO
	p2x0W3u1rbi/+KufhspwlqenneXNIcVtY8gj0pEBh98E/gKjGieUDc7yU8T0jy0BCd9Uq1QlcX5
	6k7iQFGEs93DTBXTrEdKOOvbHJsEHN6VR3kR3BAWglaxs2jo7BBgAridNZopu0PylCVxtgIQDPs
	aqJaM1WpTNbe1hu24imtHx56+/OLG8LMCWqrT/hiou8Sd+pJhw24Z+4hVwH1LGjOkBVaqYbNTpl
	raXge9ZLccZknqQ+k7nyY0YKEeIVuEetQBCGY41RSwz/Embc8rA0Dm2ivkFc=
X-Received: by 2002:a05:6a00:14cd:b0:824:a6d8:3fc0 with SMTP id d2e1a72fcca58-825274bb376mr4199757b3a.25.1771493982390;
        Thu, 19 Feb 2026 01:39:42 -0800 (PST)
X-Received: by 2002:a05:6a00:14cd:b0:824:a6d8:3fc0 with SMTP id d2e1a72fcca58-825274bb376mr4199742b3a.25.1771493981923;
        Thu, 19 Feb 2026 01:39:41 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2ac83sm17710250b3a.12.2026.02.19.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 01:39:41 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:09:16 +0530
Subject: [PATCH v6 4/4] soc: qcom: ice: Set ICE clk to TURBO on probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-enable-ufs-ice-clock-scaling-v6-4-0c5245117d45@oss.qualcomm.com>
References: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
In-Reply-To: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 4XBOn9fCx6wjWkkuB5NyNm0RWVD-v14k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4NyBTYWx0ZWRfX8VD9I9EwEmUo
 cXYZwVOF8Skfj4zUJEw9+vZvC4pD1tLjewOdv63t+sCJScADku1qTSzYCODrA6xbRWIgwHVYoOB
 AYqp/n2LsBzdWS/JxRTML1Lp6gSVnlaNDLf6BIu9CXd4RG0tr/2ztnNzeX4ofsfD2T/4npmn3vZ
 6q5Jt1T9aSZOyBdpQk2vV+b0IP26CL/MYmo0wkoUbqNp839X0UP+VIshRs+EVBh8dUJoQXDYSXy
 8ZZbmAEN+5lJAOliXdK7Eem8zle//A/fpBLTRqB1JlQN5RxHkL7GJSr08uZDi314xeonFNByQRb
 hb9mh0MEiZNPILppKbnq6fBHBRTfJxz5Yej+oc8xwHZGXBpZRwOLu65d6r4Swu2p8XFusxUp003
 irxO7ELyqmp9np5kTJIdPax9kr5mOQrR/CHkeHaKwhDftG16o31AlMwQM+7zNqObQRghQnkPxC2
 6Ice5NzMSwC+evmXjTA==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=6996da5f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=u1bwIIJuvd_SIhYoViIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 4XBOn9fCx6wjWkkuB5NyNm0RWVD-v14k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93359-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:~];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92CF915D75B
X-Rspamd-Action: no action

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during probe to
align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 1372dc4a4a4d0df982ea3a174df8779a37ce07c6..a60a793f9c230e08ebd7cae89a828980e762db27 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -665,6 +665,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 			dev_info(dev, "ICE OPP table is not registered\n");
 	}
 
+	if (engine->has_opp) {
+		/* Vote for maximum clock rate for maximum performance */
+		err = dev_pm_opp_set_rate(dev, INT_MAX);
+		if (err)
+			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
+	}
+
 	engine->core_clk_freq = clk_get_rate(engine->core_clk);
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);

-- 
2.34.1



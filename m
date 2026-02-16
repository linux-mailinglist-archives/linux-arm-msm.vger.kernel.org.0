Return-Path: <linux-arm-msm+bounces-92952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNw4GiIgk2mM1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:48:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798B144114
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA8E63064AD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8682E62B3;
	Mon, 16 Feb 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vm+35B4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/UXavjQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A573101B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249401; cv=none; b=cDL7wXMO1aSMT4VuDXkp0CbC8eIy1I0MMYVqMcEgvx2iDB1pt+vGY2FWndl0Jbum40eY6HV3YVr7YWgGZgQWkvRSE2h+pOY/pSxIygYcxFFZcIj13rlzZFuMhgU+03zc0KhAwvTjVk0xjWvneD2Yc70DGuBUONmKNTUgh0tISho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249401; c=relaxed/simple;
	bh=G/C8E6tnyrlc7aXmdiruS70Vl6WjWr9lu5dVB+apm5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EFmhqcqIItT5zaZzxNz/W8mRcVoJmDvHOvLl6SoLINNhmOEaDdhtivCiipUJ98gz+HnfEMtWR/K1fCl1iaY2w9KAJmAPesLtLIPJRXLSFQ2IpbxUKMuiQ14HXB5cU7Un0gE0JtJdmXd3gfII6fLnqqWWq5VkkcGlPllAMSvA5jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vm+35B4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/UXavjQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G9fHnU1476507
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o13mfHfcaClhodqHfsXTqv
	g6+iAu9vhr09PZvEYRGDU=; b=Vm+35B4EXUNf3We6914FZCS2lAas3sfi7ppyEa
	NXwlgIalncbdmozTebAjotlA+yZ9g5v7GnP/bW4OpTZarE6kMKE6w48aJDoJm0Dw
	HqLsX+gjBGeBnm+Kh95QmHYippFbHRlSaLftopClv/J6+wgvOMv7UKy7oJxM0sRJ
	9tlWUWfa2Key8XwVgZN3x/W/vo07+Q2r+uiNzE2Qp0jiguM2kdXwMP5aTmX0BLik
	1vlA69ifymTWVpEk6HAxBgfLnIsLurVhV8thp+DWnMgDLD4adUZQmwhYvtdNGYho
	B6Xq1Q5AHxkL9vsJlvkCA8MMYmm9dQKPYTzsS/pq93iaA4yQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caerc4y5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506b4005ab7so245480721cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 05:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249398; x=1771854198; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o13mfHfcaClhodqHfsXTqvg6+iAu9vhr09PZvEYRGDU=;
        b=b/UXavjQxyEkEZimMlRUlaRodQtsZq5AcBXDuKZ2bNcgV78wPjTLhdrdtKSg3FnJBc
         nlA0RUJJFirn8eys4x5PdRX1YzMVKeuuoF8zSt++J1kMlWD4JEBPdNX+bOmCk5BTcG84
         HGFJgr3TxUq5js2uCZDXGt5sSqua/GDmvgB3c5kQ3pTOB52Qmm5Sibn1TPa8qK7uqz34
         8laNLR2554Oc4ts0ujqhC4oRlP8aH8B2TjOXwf4S+xsR2rycp7Z0HPL8hTwjIpRhkz7j
         w9KVluS6qYbqKWwglkunpfbGRsQTSdvM4FO+G7+tWk1R4ez/EQADddFSL624X3pprLC1
         Y18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249398; x=1771854198;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o13mfHfcaClhodqHfsXTqvg6+iAu9vhr09PZvEYRGDU=;
        b=mX0wWrBemTk1cIoP2Wd3tpsacWp64LEp6xrSHXoDst+K6GnWebRHe1mAIu0y6Blhr5
         6RtLbEuEIdXLR9/JoiIIWb4NK54l0bgJLOeAx/WQpAFa3DUoxFMMV1cFexr+4qL3IOuE
         AkXs50F996zS+R9MWPCC9t7XxaKKCERwWSlep4dt78BR+jplY0iJSJ3UCkQHaPUKBBDA
         XNP81s3UfCfYGi6DkbSntBhHUttTKkNtTfOKfJRx3cjLCZDAKVA2b2U65Owar97dmMKw
         D4WbuqRWj6QAatS1jjjihfenvZlg9MX94kQCd28nSa6v4sZADq0fXu9N90evy9uQ8qMd
         os8A==
X-Gm-Message-State: AOJu0YwaKlsVaasXjdajRhV9+fWSvp9AFW4Faol3JxcoHcvSEKsrVu/v
	f420GP37IwpvxDI9XsnUHQc1GL+Z2brU7OqDvTy4Z216DN277JXrYIrEAio2q04azE75sjP8ItH
	hSJ2Zy2vsWp4JuELyfLK45nHpwmG1cVWgdRoW35Pg3ftqo7/ixRpEVgttASszKd04z0qy
X-Gm-Gg: AZuq6aKMW6mJ7zXa0MzfnYLkyIjHaPRVxzea/4ohKgWwpHE4QVb0V28km7Hn81aPCqF
	F8vKxO1TfwQ1HP7swBU9+e5wPyCZNlcytHDLGBubDibedNqF4n1QoR+1anjE5V6DhjSA/ct6fVn
	jdnqAj9YUT2ek8tBIO46yd5QkYkGmtioSqHMd4cKjK8Sc95dxChWHkbdrKcU9EnPJFjSigtMZIa
	5hdshyVYIvVqSq3P6l7JAdD0a2rz0ij+ouZwFZ4z7jwbwXAnLWS0m1ryX/zFhayAM/HatWZYCOG
	E9OYnQl7tY2sib5ifkmUKNErYN8h8oJ2ovvtgSUF4Z34ma2DuIOnb2r0Soszg2RCzCErvi5ivQT
	KGom+tl2qahB1mqsLFkCchVSNIY1w8Q==
X-Received: by 2002:a05:620a:462c:b0:8c5:e166:fa14 with SMTP id af79cd13be357-8cb4249ab6dmr1296952385a.73.1771249398174;
        Mon, 16 Feb 2026 05:43:18 -0800 (PST)
X-Received: by 2002:a05:620a:462c:b0:8c5:e166:fa14 with SMTP id af79cd13be357-8cb4249ab6dmr1296948985a.73.1771249397631;
        Mon, 16 Feb 2026 05:43:17 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm28883025f8f.13.2026.02.16.05.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:43:17 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/6] clk: qcom: Add support for basic clocks providers
 on Eliza SoC
Date: Mon, 16 Feb 2026 15:43:02 +0200
Message-Id: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYek2kC/23NTQ6CMBAF4KuQri1py78r72FcwDBIFai20KiEu
 9tiTNS4meQlb743E4NaoiHbYCYarTRSDS5Em4BAWw5HpLJ2mQgmUsYFo9jJR0mhU3A2NEHMEIq
 aYVYQ93LR2Mjbyu0Pr2ym6oQwesM3WmlGpe/rnuW+96ajb9pyymiaxg0vIt7kkO2UMeF1KjtQf
 R+6Q/yCFZ9G9mMIZwAgFnGUVwnkf4xlWZ65r8z8BQEAAA==
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=G/C8E6tnyrlc7aXmdiruS70Vl6WjWr9lu5dVB+apm5U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx7o23fPvCCd/ziw5IsX4TYPH0rSLlhUyXhd+
 pabptFqo9OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMe6AAKCRAbX0TJAJUV
 Vl7dD/9zgFF1bTT2xK/+bBhbjXJZVk88dmFEB80loFEV34ZYz5ibPUkAQFB1thrc2WTQ+Fpgfs8
 YRZnGHJKaxOLfCw0d9rFAcVaLxE1YhqNAM4jwRoUj6ptqcxLHYvGhdaH1KT1jtnp66m8HUEhnZY
 DygCcYTMQOM1RsEmqvkw9uq2a7YeOJ6x97JM/TO9U64+hpWmgJhq78k6EU0U5MRP5f769aUzdkq
 rzGFuStvFyszCsxtblwMkIMHogZ67ayA+tJdaJZBcfWPMDFKkEs6oQKMm9BcJdkB66uZAsfZaVL
 7K5ma6ZlblUFYV2bxMXCoYUGp5iV1Yqe33mZVE5CErVWEsd5+5SZNTQTkMzoJFY2h4hBs6ZmzCJ
 7pmUGc/ugQYohInEY+YmwtrEbAxUbO2OXJs/uZVTQBhGixuqChGGahS9EvysOH1E0onDHz3k5Fd
 fKBRfZrFOz/Susz8WfIwfxm5DAtvUxI3+OKe2TcvQ5Es49D4hloueYo8DCFbIjj8xyZUDOlEueH
 CxublY+ZqtuxmPZbimTUwioCPZswXwoYauDk9yrRDyz675tC2l0nTdMieoXLGdo7p+7jBMlVCYv
 GrYCCU4KgTd0izIl3Tv/1TSSjIAEbV/x3rGwRXF6FKDMKzUKYS1w9W4BAgVIv22SxqD78JKatQk
 O445vmRzUjd+8BQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=ZJraWH7b c=1 sm=1 tr=0 ts=69931ef7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=RHXNpSf-syxuuu4qC9MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: i8f1ajNZgqAnoSVoEWMJY5azVVRn5E41
X-Proofpoint-GUID: i8f1ajNZgqAnoSVoEWMJY5azVVRn5E41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfXy7sURK6FSOcu
 4X0eCV+xW940lUqr1wgW9AuUY8rqB32hloN+aMvDYI/NTxGTZNLdB5OCfeUIWaR2IK4ytW/RIWG
 dcHe+a0GngWbivnznMgdhg8ujsxjGjgUD5cunFwTLZ+3+Zkq3CV1GyAhkr2Nul59b9Keo74zPWW
 Y5Xe8lE5iOorDxZpVKGAytVCtkw71FrLGAvUUBQFiNnE12gz6xG/Scl6zv52AebAGcWxm2fOVK8
 NpmUW2sWYxbiQwqgwgaqxTJEwF4UAOAr7E04lCYyIUE3/Yy9svQi+25HbtWJj0mJt+vkk/cDAXZ
 JcK5Cm13rntKN5/QgvsY/l8jhD8QJCjbw7pJSMdHjkcN32wFYcSmYnX5B/yGbOCZsVbOPYp39yg
 cA+dMx/lGNl1JwxSCOE0gsV0JgUXaIgCg26lj0GSjm79BTUjcJUnCuDcuqXpN1JPp862rHVxMn8
 QYJAs43c/aU/5FvJd6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92952-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0798B144114
X-Rspamd-Action: no action

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260213
- Picked ub Krzysztof's R-b tags for the TCSRCC and RPMHCC bindings
  patches.
- Picked up Dmitry's R-b tags for the GCC and RPMHCC drivers patches.
- Added missing TCSR PCIe1 and HDMI clocks, as reported by Konrad.
- Fixed the compatible order in GCC bindings patch.
- Link to v2: https://patch.msgid.link/20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260126
- Replaced the all-caps SoC name everywhere
- Created separate patches for each clock controller
- Dropped unused header includes
- Added parents to all TCSR clocks
- Added an explanation to why the Milos GCC bindings schema was reused.
- Link to v1: https://patch.msgid.link/20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com

---
Abel Vesa (1):
      clk: qcom: Add TCSR clock driver for Eliza

Taniya Das (5):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   20 +
 drivers/clk/qcom/gcc-eliza.c                       | 3160 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  180 ++
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  218 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   15 +
 10 files changed, 3622 insertions(+), 2 deletions(-)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>



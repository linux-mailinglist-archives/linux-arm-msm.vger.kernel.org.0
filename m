Return-Path: <linux-arm-msm+bounces-96279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKbdKTbermm/JQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:50:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF9D23AE52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7667230200FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF213D3339;
	Mon,  9 Mar 2026 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIycF+ri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUq1NndT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0787B3C199F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067496; cv=none; b=cT1fH3/w7nl5mrRFM5I8CUHQ1Hq5po7ZAALxkTzmkRiOEHix5iHh/g8xpZADioZQgJWAzEl/9fRPtJqZcjpm6snZFvxoWk75jRKneOCxZCIn9au9xgO9jvXIJfq5jYrbR5gdGVFq0/4wUQnkV7wpIKoTwyoCuHhW7F93+gPijtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067496; c=relaxed/simple;
	bh=fxH1veD+kpffYQiZ+e79p3JhbxkA92PQ/Xt0yhjG5zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VXbKZiMU9ECPVVUEzctd0kPUW/gwFKN9kTaGmKPGN7YI6oruzKa96lfjFcE+qAl12GDFN/Q94h7nIZ5YfliroZpISnNhog8qxqqj9YRoSSniAYiB05Ly5lOQJB30jcMKYQfZ7XkZMj9i+XBVBNp0VNvJkmdnMh/tZ764WI5UXSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIycF+ri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUq1NndT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629DqkDR4143734
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 14:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VkpszuqmGmuP+de517wzNg
	dO3IYx2diAtd5lrcL4LOE=; b=hIycF+ri4U9yxV52k54SVPk26Iv4ilQ7OrTrU9
	9DNC4zRIHqJ2eTr/Dh5xLPzXAFPEDg6F7dHE0xHBFe8hoaaKXgDe3XUuYYJF0qUf
	wzM5FOs8QT5mE4JUsk3C8UTo8UjPbP6SnkGdtZzPUYApXONUyNDJIX0jUBnk6Myn
	jFgSb1NVJ4C0Ry9dFm+U4xqT8OI+O+23Wp51/uDlGUF/TOsdtP7YXlUKPCO1eY0S
	xRX+pA6xBuSeeAJoQayXyoRNWTAQwF+SqLZPeRyUum1e8VfxstrK36rAE3+Xh6DA
	TnG/Al81F6LMDPrS+EagqFyItBbej3iIoIP9+EAVnAsHYDMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6fdqn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:44:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so853601085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773067493; x=1773672293; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VkpszuqmGmuP+de517wzNgdO3IYx2diAtd5lrcL4LOE=;
        b=dUq1NndT5wOeOBZ2fQ93DNkYi31jVzGDY50LP4BCahqdd2f51rt4J+TjIvnZ1aBiyK
         KBYCLOskNFRFXUMd5l+VSX0NrKvr1TWDGMHu3Z/ztaJBCkbNt7lcrBks0zOsdlPy48ne
         cmkYEBnH/pHyeQB/UVnCiXyyhUnfDs+NoYEpKeLFVlIK5DIzpTPTZCIUzfivJb38wmQ8
         eoeIU8nQnU5G+DN/8Hb4ZsHDHb3dhWXirTFOoTQ08FJwM5I8BpiGWgGxXBDeRtWIZbn1
         pRLSEwQqNhzVnu2WmkQa4/M31FlRvjBnm+sBqBJyJqoQfRN1dFph15mgcoXZXRt9mvX8
         Xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067493; x=1773672293;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkpszuqmGmuP+de517wzNgdO3IYx2diAtd5lrcL4LOE=;
        b=asMvpikl6GCpOkWJPuYHbnpQanihjMxqJKfUKZMbuYqI23WzEIYt6YUlOhf+O2XWqF
         0ZSUSBvCRoULHQsUcrthtjesnfoYVlGCztoS601DarGseNwFhl1btS+srcvKxtKtwACb
         dfJAC3tK6GZkG7DYXbK6262dEWMDUNdM42Oa4K2WrMcOoZ/tlzGc0VXnQBLBqbx9v/3I
         wViq8F0kWMUT0o6ifKnCtC1YZY7eZyOsflxltP0dS7aghKJKGFDIiH4g06AUC40T5Mfs
         90s2q4PK0Oz6xbUNtlemRNCzY/D+iycjh97PTCxXwPlRljcLWvMW0FL0TGrUk4FdcfwX
         j79g==
X-Gm-Message-State: AOJu0Ywo801N7klqYvdZaQvRfatQLRy1Lyl72XWx7/X5fIx+A3dtYPxk
	TpR9prwNlPz6oTwr/CzEyF5n/3Mj5OiHRz/h/TPH4tZdSaOumnfxiAGHA8tWexukU8XEGU4bH+X
	FOFQFjm/DOzCl4NSQwkQDYtPOatfaRxt89pnuHHqocvaKrdGEUB6//UBmrhgCjpvQV0M4
X-Gm-Gg: ATEYQzxLscFYRe6n7muTC0BjT6hQ4xpAguXjKRK0/5D16Cp6ff7Soyfv2fEMG4ZHpW3
	jAYg5w7vaAOIQdrZxlp1XU6SvHISUX7WfyQ4vgINNCWupdLvlp41fTk+Fa2DXEGT/AZBV1TJand
	U7M589PZWX/mE2wgh7j1heXfmfWLiiNOr5uVRGR3bFVJWc0KNLBqMQZzc6cz5TKPseSUQ4BHDvk
	DAFZy6Pjc4xdocQslN8/ltRTwt065pVC2ISk5XQSxCyvQfm2k34UT7EuRz6vRroM/w0mCE0CTIS
	cgSGcp3LDh2JE+xy86qjESe+opjvLF+h65bq3VLZsQ20ECO5GnYungmENQhGDKdBz/cdAqJ1Pp+
	eTZ6NPoGHjK8knqqg4fFmJm+BiF48IQ==
X-Received: by 2002:a05:620a:290e:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cd6d461199mr1405399285a.54.1773067493131;
        Mon, 09 Mar 2026 07:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cd6d461199mr1405396085a.54.1773067492590;
        Mon, 09 Mar 2026 07:44:52 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm27650278f8f.13.2026.03.09.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:44:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 16:44:45 +0200
Subject: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANzcrmkC/yXMQQqDMBCF4avIrB2IRkv1KuJiEqd1RE1IbBHEu
 xvb5Qfv/QdEDsIR2uyAwF+J4taEIs/AjrS+GWVIhlKVD6VVgyMtjvAlOw5eo/MeNzIzY1Vr86S
 atbEK0tsHTqNfuev/jh8zsd3uHJznBXihzkx7AAAA
X-Change-ID: 20260309-hamoa-fix-dp3-opp-table-453b8a5e3bc0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3989;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fxH1veD+kpffYQiZ+e79p3JhbxkA92PQ/Xt0yhjG5zo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprtzdH2Qrp7LUSZydRIBrjCGaKjPEeVe3MaElv
 UveVDtJKDmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa7c3QAKCRAbX0TJAJUV
 VvFgD/4tcm+j+xELqQS8Zh/WSsYyOw02i0k07u822dZNUE9Gf84GGS38DFz4TWH1O01g/k4dFL5
 RqGluQcMP18AvsBvslvrtu8qNMh53sMGBIIpWpr/qyhk8J/NUDyNvd6yFeYzSjPGfzwFrttW+ym
 2myiD/7TIM87fjE62sNaTldQf9aO7EcPqLTcXjarXr2uSsHHIr9zkxcT705ehWrXCdHG/OyVDYX
 30F1EGKpUOLCGqnSAB9KkgZx39wm7W73O/5ycHzB7Jkw2acDc0nO4g9FOWQNYSXb8dnHliKKnwm
 1ahVHl8l5DN4cXogRJwqq/KDpYApj4ktUEIL5cwRqZsFUCVqpsrcObDU6KN6nqt1cYh3i6KhD/u
 NztpINmFL0GOpQHfP1qex+2BmBfriXj/aWR7cLZE7MFyU1ZcFKILMCxsHyj+myfVviCun74113c
 DwFcvV8qG5KLX/evdGtS5xCgfcXAeq9C0AgR4TxoswZkOIVi+9dHuZvIfvOw2FfzpTM2poDVt2m
 2Yit+dMyQ2mDGb2+B12RekqCPpzm/NQP5vRMtgIKByAVg+cWdd8+DNMSxPjyzrVjcr7oiOk9pId
 agdWe5gB41tgXvi9VdGXHE4GIoVp7NdSka9yYJARzO8k9M6L7O3dRSNMqYjqyOvG3ubvd3i7fSh
 lESvRgmDbop5MXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 7CC8KYtJ6MnsFnkrDqOpThVGKa8F3MyF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzMyBTYWx0ZWRfX80B0M/8qhhVz
 V+6Ao5EBHW+BXg0+FsJF2DfS2qIQg3zLHOzIfS+/hIE8TYy2PGAHT0sy8n2htUIu+sIbLTWXRFN
 5l0Tq3yQJAhHSwmQS3gjafMFwuYhrbAPYnd2Zm9DXmm6duduXEZsuWUPh+EgD1xLW6xeb/RxNqT
 e1AZ2x2st4g0tM/0AZp7tpyC7NsLRKSPWE4dyV2w8TP1Kr8Ce/2Pto/zJgXNPvckyJwZTje3tbT
 p67N9mfcasN184+tKMv08ra5yu5D2E4MH3zhp+dalxuV6sdiM2bWq2kjyeGjoJVLvp0uetxgDSU
 yDCelmoyFDjFzsHPfqYpE9yfM59WtQPz1c4E2/gDcPRkXV6MA0RJnU+jwOdnrK5/0qdacsJ/RoY
 LhgpPaSvRsVmjfVnH6V63QH5rLVa5o25K8f2bZ5teslD+mAgxPcfN9/86RzQkwe6I/z+kZ+V3c/
 eL9gVRnpLe2DiIfnNGQ==
X-Proofpoint-GUID: 7CC8KYtJ6MnsFnkrDqOpThVGKa8F3MyF
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69aedce6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JWXbo1LX0rybKiAwq2AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090133
X-Rspamd-Queue-Id: AFF9D23AE52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-96279-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

According to internal documentation, the corners specific for each rate
from the DP link clock are:
 - LOWSVS_D1 -> 19.2 MHz
 - LOWSVS    -> 270 MHz
 - SVS       -> 540 MHz (594 MHz in case of DP3)
 - SVS_L1    -> 594 MHz
 - NOM       -> 810 MHz
 - NOM_L1    -> 810 MHz
 - TURBO     -> 810 MHz

So fix all tables for each of the four controllers according to the
documentation.

The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
in that case.

Cc: stable@vger.kernel.org # v6.9+
Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 49 +++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4b0784af4bd3..645bc412b0aa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5658,18 +5658,18 @@ mdss_dp0_out: endpoint {
 				mdss_dp0_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
 					opp-270000000 {
 						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-540000000 {
 						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-594000000 {
+						opp-hz = /bits/ 64 <594000000>;
 						required-opps = <&rpmhpd_opp_svs_l1>;
 					};
 
@@ -5747,18 +5747,18 @@ mdss_dp1_out: endpoint {
 				mdss_dp1_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
 					opp-270000000 {
 						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-540000000 {
 						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-594000000 {
+						opp-hz = /bits/ 64 <594000000>;
 						required-opps = <&rpmhpd_opp_svs_l1>;
 					};
 
@@ -5835,18 +5835,18 @@ mdss_dp2_out: endpoint {
 				mdss_dp2_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
 					opp-270000000 {
 						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-540000000 {
 						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-594000000 {
+						opp-hz = /bits/ 64 <594000000>;
 						required-opps = <&rpmhpd_opp_svs_l1>;
 					};
 
@@ -5918,19 +5918,14 @@ mdss_dp3_out: endpoint {
 				mdss_dp3_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
 					opp-270000000 {
 						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-594000000 {
+						opp-hz = /bits/ 64 <594000000>;
+						required-opps = <&rpmhpd_opp_svs>;
 					};
 
 					opp-810000000 {

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-hamoa-fix-dp3-opp-table-453b8a5e3bc0

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>



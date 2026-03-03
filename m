Return-Path: <linux-arm-msm+bounces-95108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA2QC4y7pmk7TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:44:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CF1ECE40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F20B30197D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF48939EF34;
	Tue,  3 Mar 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRYcnjwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aScV/elD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B458939EF3E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534662; cv=none; b=YM48yC7qjEAc/M5Y/DdC7/NiH+c6qTEEfp5d7jhj8sdLQk+zqkb2CQyPPENQPwm/nqoBckFRbod6Das4aY99t7NvcSdVFJhsL+08HZXcqJWQpnCBGbfFmHtba1BRKkH2PbBPYflK3TxMxA1I6kzvdre5zXNqWFWryj33oMCs/vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534662; c=relaxed/simple;
	bh=A6yKC37kbLmHAXfvQbSkm9E5IjGZ4zX3IeD/gVvS87E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=al0Yn6RtarBS8BX/BEGFov7TYj6jAUHV2QU8NHFyRFBoI9gl2z1M5sFjTv91434aq+AYNVwS//loOQ1f+AXdgqk526GlVjNFcaWEaB37oZkK+G7JqdQmew8wr6lZAJMLnBlK8aloxSRKBJGRqcUeBw2hmLfFyUidgg5gFLDWPNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRYcnjwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aScV/elD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nJk4323936
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AJ8W0uX8/cR1b0D9Ac0thv
	jozLL9CAxwU1NrRxPf4GQ=; b=gRYcnjwTDz1RUIriOUbRGSuIAXqQ0z8JqIuGU1
	fMHVWtn4MLegSamxvt79gdigo2FyT4RBZcnFRpmdcxwIa4ObsJtwxxN9GEQSbMV+
	8T457K/V6zKTmRXA9PoTjQ8FenTpIxsQBi8lUSUFWFUL95C5b6pUTWTYYM3tvoQ7
	iGGGCsuRARz0jZFVzIVWOiuoT7r7DmCU5+129iwW5Of/8ngIfAJ/j8KYG1RR7MR4
	Q006VEyLpjCRiLz8M4WLvXDrE+/wy0HoSY57XgUnqD0gp9/odbAnCP/TJllSwXnM
	FyUi8phP6PzGzV8BjddvH76WF0wnu0VwerE6MKC83yQtUFNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfurvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:44:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4d191ef1so667154285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772534658; x=1773139458; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ8W0uX8/cR1b0D9Ac0thvjozLL9CAxwU1NrRxPf4GQ=;
        b=aScV/elDq7DG756z4kqh8ZhOzXTY3StZWoGh1Cb6dOjyf6hGdpUSKLnxoufIjb1d2q
         Z1lM67w8E9tZ8AuIIadEGj0gTUZAKuu4lTBvZexHX+f5Hvyp67GpNwrcJJzgrP1o0Gga
         aQPUBWyrta+qkrIUfOIcbYuePoLFaduJvlQXcrl1g1+FOEa7JA6g05cPFA/aYR4jg0+Y
         5XaH/TUhyAqVbXTANc/ck8uloGXvSSIh93540yD7ezbxM6BvpuW56BUnGqs/m6v5Nu4T
         zGaW8cVOHoAhvng1wnqxUH4jOduW5/1jVEoXc9OAaHVzgC9MigNOj//XrSYdQBp880HN
         t3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534658; x=1773139458;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ8W0uX8/cR1b0D9Ac0thvjozLL9CAxwU1NrRxPf4GQ=;
        b=aNXeRNRFv4+Hu+/k6BrDMO88Zg84KV1p5vgHTf49tMnZCaEckTL6s0SViKgDAILJx8
         yQDXkaKnE+pOqMBS7I7HePQNhmhafe63It9JrrVUSPJAejS9G3Qs4mwWcDCp/lu7UIhD
         ogRS+Vfg7FUGvl8DJ/Pdg50rCox5Pxax8g3TSrPzhznz/L/ACNeSnw8SUzFOqaY/yY8A
         BbKKE1+l9pdK81ytmObgQl6ofPCF9oi8O0N9WKJ16qEC04Te7/Ag/c+/UPZLgWl1KxML
         0Hrjr2LWtTNWnzR3rfCyU5b04Jl5cUfkyUDVabSG5TtVEtiTQTd2IzeHcgQKiyDpNpzC
         hvxw==
X-Forwarded-Encrypted: i=1; AJvYcCVTB4ZYFskYmK0KuBCC4r/umhEwaowfoc99hCPQ7jNQBR0fqfhtWxUb1l5CnmCy2/hDgFWi8lu9N30rtkVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0L1js7FAjnbwkRKY0+ZqXUsVNwZlBizVho7DlRyyMJ0536N6k
	bFaZgkhbfrXNC6aSBFdYJ9TO1wgk2cZ8Eo7J5wK66U5/kglRwScEsEyKSHDhfDSkH/stGItXdI/
	8G3lVx2YP/6gY/Q+9fMCMNUkE9JeekxbfBDwLiabv0X85juXlf/nyXk1OU6jV2223lBLz
X-Gm-Gg: ATEYQzyOM8c9K3FiglYLXV9aQfqcmWYDTIERdVeeQnKe4gAJOpvyiA8i1mObE+rl9LD
	NrHH4upawGXnCUTs47PVPgWuedFQBAWDA7MC0pBqqxhzTeqEfxXxoJgEVEi9JVU2d4RFFPqlHBr
	f1JzKZ0YMTKnmS1tYNAMXvUVGYnz9s530d2MMwOcRp/TmYVZG88Vv80DaJJ+blxEH2Hk7J/lCoI
	/br6S+NNQKjbWmrEqBaOv80JpW79m8V79C03+StcJcy+yTc1o2tN+aZ15o+colnMd0R4+9vD7mm
	pHRu2Jn5yg7gJxkN1FWWxazQ6q/iawcA75V7dXpfrAxbrAXhfbaj0/SBBnNX2i6zJVGamv4iEf9
	SjcKwkEKZr3IyBj147gdQWwLbQrRkZQ==
X-Received: by 2002:a05:620a:3193:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cbc8f62936mr1793120685a.77.1772534657896;
        Tue, 03 Mar 2026 02:44:17 -0800 (PST)
X-Received: by 2002:a05:620a:3193:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cbc8f62936mr1793117885a.77.1772534657322;
        Tue, 03 Mar 2026 02:44:17 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770e7sm365722485e9.9.2026.03.03.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:44:16 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFT v3 0/2] arm64: dts: qcom: glymur: Enable SoC-wise
 display and eDP panel on CRD
Date: Tue, 03 Mar 2026 12:44:07 +0200
Message-Id: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHi7pmkC/32RTW7CMBCFr4K87iD/kECyYtUDVN1VLBx7CC5JH
 GwnAiHu3kmgVReIjeWxZr735vnKIgaHkZWLKws4uuh8R4V6WzBz0F2N4CzVTHKZc8ELsCnCyfg
 W6ubSDgFMsKCtBbQ9cLXndMdinXFGhD7g3p1n+hf7eP9ku/tjHKpvNGniTm0HF5MPl9nDKOZmk
 st4IbOXcqMADtSplEVlBMpt4zod/NKHepYa5S+MvAv1GiYJtqFOvc8zNFW19TEuT4NuaKBd0sF
 2t7v9gKeBgkqPxf5yKhezkpRr6A+Xu1KrBOAQKwmtPiIE7FEnDOD7REnrBnIpzMYIw1W2Ksnw/
 +AfwGexT7YJC3Hoex8S5GJd5bawXElTjuoZZvL1mKZfAdq5cp11XR3JVg2m8eYYYc1XlhtTIe6
 LclxNoEpHhCkFl8pFh+cEM09xSZHcfgDbc2yTQwIAAA==
X-Change-ID: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=A6yKC37kbLmHAXfvQbSkm9E5IjGZ4zX3IeD/gVvS87E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpprt8IH7vWsZp94kXXV3ud7/h6wtrf+/D3HuNd
 2HVNXcnVNmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaa7fAAKCRAbX0TJAJUV
 VrBmEACyuk/ae2xY92FzHmihSOB+hJBb9jHaYuiXyKxb8i8wkIcArJQ94pMV32ok8wEt5/ZnyJM
 3hCtG0yy5p/Q/8iiwbqCZb06Yk0pMTalC75vQvlIwFDwbZkbOZE8q/VUqMauUdekjzLIK7mtVXe
 QLqHe07jW7t4k9c+RqHBP0t3NXuIfpXC4nUO4XkYOMMLSxdoTDZ03s6N8jNKv6+5UHv8LFumnu4
 Y9XfVV3w+AbVbdpRScUQsdtNTjLly+q8cOzGtM+s+tjDuTGNkcCtitetvz2lwAsjuo5yxUUFizl
 4eBkULeUUpSKPfOlO8UfsUMD9CdQfGCEviIl50DkMT9ierLllSA58K29e4HiJgpWL4tCP6D6IVC
 tyUjfJa/o6gOiNnKE0mCzcKdW+vFsnbMK84DBhf20dIfaBCInRLlsNLgXSIpKNC6497atqLd1Vb
 YUyYCkW6FOZDTrisv2OrZqAz1JLiE9SRKOtba/ukA4V9/LIdaBdlGX0Gdet9XWl6ytwJ63uxOT5
 9N+eNKJL5UHW5MlyenS++jZWrhNYWSsWmEz3a9D6isqk2XLzn8cOXnEwRSNE7cxkzs3KdsilQer
 wyiD8zDk0A8G/07kCehSgEc7hyyHH002sVefqOIPodaFGY0GmlwQ0yEDQ9zx6v9WTexdditCCaj
 DRqiCEo95U98Vdg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a6bb82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=nCwisqI8jgOkjSoXzy8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ycxfrHLiklG6VsF_GXmfY9Jw5S3s7SBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MSBTYWx0ZWRfX1YaPhgy3eb3U
 cutjNzhZneVrHsHqdPO1X+3siuZxf6wH4/g7rQh0ZjLSl5dcCFjTtgOgrR8X7kkpuHsGPkjS9RK
 5hPOgwNOdcrnq9Mh885AaQlHxH7HS3QGKlgQfBJj+ZqlYa6n4wMO88WN8OSQUECs756h43WYqAf
 b/D1sHmXfpig0B1K1mZ2Uqzo+RtDqPuGhsyexXotl+HNwzPKXc8ZlP4r/TtgCj4548s5h9MCDWc
 blTlijhDsTFnHyo/GuCvBdGdJghH5Z2WmRqrf15O1ju5K/OEfs1vKuyXkMJlgasWpJl26EURPxR
 hnY0K6TbDQgR5Ew1WpAqjTTAofhuMoCF+P/qfGnNVX2VepliShzwC8MkZSox/V6vJfWbzaHmRZw
 OEZCvHX6kR1Dh/mFLvWIcnoIrLWZSllUvirLUhnyQURD1w3kabstxfu/VUSyY3XnLb/X1ptABL3
 obfc82gdZURW0AEspxg==
X-Proofpoint-GUID: ycxfrHLiklG6VsF_GXmfY9Jw5S3s7SBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030081
X-Rspamd-Queue-Id: 2A6CF1ECE40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95108-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Start by describing the MDSS (Mobile Display SubSystem), the MDP
(Mobile Display Processor) and the 4 DisplayPort controllers it brings,
then describe the PHY used for eDP and tie up the PHY provided clocks
to the Display clock controller.

Do all this in order to enable the eDP panel the CRD comes with.

Sent as an RFT since it was only boot-tested on a remote-only accessible
device.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Fixed opp table according to Konrad's suggestion.
- Added missing reg regions for all DP controllers, as Konrad suggested.
- Fixed all sizes of the reg ranges.
- Replaced all 0s with 0x0 in all reg ranges.
- Added missing clock name entry reported by Dmitry. 
- Link to v2: https://patch.msgid.link/20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com

Changes in v2:
- Add missing PIXEL1 clock to DPs [0-2]
- Use the same opp table for all DPs and drop the dedicated ones.
- Drop the extra compatible from DP1.
- Changed compatible for the panel to samsung,atna60cl08, as that is the
  actual model.
- Link to v1: https://patch.msgid.link/20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: glymur: Describe display related nodes
      arm64: dts: qcom: glymur-crd: Enable eDP display support

 arch/arm64/boot/dts/qcom/glymur-crd.dts |  71 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 471 +++++++++++++++++++++++++++++++-
 2 files changed, 534 insertions(+), 8 deletions(-)
---
base-commit: 767cea52f08277557c8ba0e37638f2e7da271677
change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
prerequisite-change-id: 20260227-phy-qcom-m31-eusb2-make-repeater-optional-621c8c1c0354:v2
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v3
prerequisite-patch-id: 66643de4d7142692ceee6ab78d4c1fb446182123
prerequisite-patch-id: 056da4cc346b633ccf7e12536839eeefa9469b78
prerequisite-patch-id: 3d3c5004e30407229b8f6612ee2c56dd6171447c
prerequisite-patch-id: a4ed5f8f3d10b47b0d1daee2e0dc44090c13c01c
prerequisite-patch-id: 144090e55a19a1479f4b35b75f9e5b80a9b919f0
prerequisite-patch-id: a9ccb06216435308c295e2de9adffb79060439cf
prerequisite-patch-id: 1e8d403675640d7db68a4c0caf28d1b1be895e8a
prerequisite-patch-id: 09bf515a2cd6bec5b21f15b18bebdb172f4b4a57
prerequisite-patch-id: e88699eb550ada640f5f2f5e4f432d6a3ae2552f
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 460edb2664f266b4f33fb213e88316ba9402b3d5
prerequisite-change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9:v4
prerequisite-patch-id: 64ec868b066c682f08ff9845e4507cbf7f8f671d

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>



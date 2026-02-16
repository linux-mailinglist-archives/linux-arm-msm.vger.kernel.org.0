Return-Path: <linux-arm-msm+bounces-92918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFLgN735kmlx0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:04:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A830142A14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10F423004F7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AAE242D88;
	Mon, 16 Feb 2026 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUzxK5pp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EfYgG2lB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360224A047
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239865; cv=none; b=Pc/6rxDKGHtsMnXdGhRHs3bmD49XuPyjATFprbZkpMKcSoSMUc49QVbeipGWAUAuwIETrPasa6QsgFMWq/rEn6XWBWouuLJEVaaT8C62GrBlaXx8qqoKUcu/XRwyD16VJmPemVw/vvYB/cxHKMIbdjZK9VcoO0zMpCa5eBTBfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239865; c=relaxed/simple;
	bh=UIwNr/KY2E+0ecUw9P2/kbSYuPp+7DKAt1dGLTzex10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AkdqdzxZDeOTbVujekJx5EBTtM5wHSREZHw9YV0YP9KRHhqNKWzeR1wUmHgR+VZ0vv+X8+P1r4BnBYahQCBHBZyBJwVjJItryhdWCuPyrnwNteE1j/jV4k3yBXo9RkHwPMfoOyeqNSiq/6oPFG+eK+0WWMwFHnb5dWz96lpZ4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUzxK5pp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfYgG2lB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAkOv61977473
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatd
	HYOoHKnU=; b=pUzxK5ppqodJ+kBBatU0/ZZj0hN56jH0XF3u43GpXPGxKdPVcqI
	nHR84PfFEDVP1BSYvddsECVpz3ZfK0mbD7SQiR8TLvuheIYJh56KDVm2JWuLhrm1
	W2D6kDQZ9QEsonkmKlzW7nTYuZnCmb0XGg8WTHoA3XPlT7xx9sShbgivUK7a8gxX
	RkdpFu6jYS1kTmbdZ217RmTsP4wWJdWHxe6Myk0MRib7e+Uq9sqwTWxt/3ltAKyY
	DBALlm0z8S88lV9qeHTp6aajLr56UlNIJFPDkBlpSFybKeQvHATieZ2l8GV+A2Ld
	9ynsbHSPckhZ0Xed1BXUHj0pcrjcg/7vbCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caerc4j2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ae763d03so329837785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239862; x=1771844662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatdHYOoHKnU=;
        b=EfYgG2lBfMl6tBIewd0GDxBnS1POjotqpfB7OPei9z4bdsrmH6H6J+Y5esOn7WZSq3
         CuO0f4th4Med0l4tXlB7YS/kAs6FbmmOpyq14SmiSP8poFgVqWYkhxCK9TPX4nsjVpsn
         OGX27C4cgsd/rZAvIxqyZBvfwOnXlf9eMp2xdy4QtTQ1SPnWRitghIevDpTGrHil7s3F
         eKrtUaPErBmg07ioV/oM6T+mJ17g7CT/bKYnGeJPKRQUbTQjt8EScJvzGHQANvwyksuB
         +zHJJzdV5SP7xrmLy+49/W0UYjoXWaUWSuSopjefKTkrAT3g0fb1ccpJJJhAdk8yuKKI
         HQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239862; x=1771844662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatdHYOoHKnU=;
        b=X5nWVRzNyU3Ly/a3sR0ycrVj65l0qNAjI83Kve9ZZAVUyZDsrtv9knGqIhRn9oFh05
         4N+Mv3DXNJiOttu9DEGrGq3dOvvUX9mE9i2Rn/AyB/tsQaOyY347gdBiJBoPdd8pxOZj
         zT0btjdlAKDh/Sju5sTeEtFR7jw2BJjVaJ7AK/xVd6ULbObeX7Iwany5QRP7N01F9pM9
         V9ppFVjeU9u7Y6XX3t8RZw40/WMpYJVGBfAwX9lwm9bGJ5+D+qgaT95q6IMoFgLYNoFu
         +ct6oiKZKFlVzjgykdpSbUTCh7QKfZsQN579s50gNoLqK/1Kymw74D+R7CbUzddGnw1/
         XolQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCoZzv7xdPAO0K54ppaDSihJwg5hXsjijbeyURVIODcDUnZdVur3mBmAeP88qY7uMvmexmx6rz/dnFV9/G@vger.kernel.org
X-Gm-Message-State: AOJu0YwtaqgOl+v8Gjq/C8wQMEn6QedmmaIYoLopj83G+p9uq9KWZdv3
	Yvrcq1JPXMTp7oPSF98WfdkYDpFJS3Z8GxUHhO/4QfN7cUYSuPPWB8y4JSYCFFtCkHD8eS8gOdl
	okmPhEp5Byj2b0LQHOsqoUgkErbWNg9bhj4A1frBgEzujcSvPlku6pCeOh3NCxq6hAT+t
X-Gm-Gg: AZuq6aI4UnBKNr7ZBNX2XfoydOZWt5MqhIaFppcCXtcSGSzOOz0m5zuRu9S/bdRisdz
	HMN9/h12a/Prq71RNL2IPjME/C64FR/mGItCNOUA16dB04pdGiMkly+3Dts8yLZhyPTlcOgZ9cy
	2kRCGBjvb2Gm6h3OSLMQjLDP838n+4SUhHjQGftEBWy2yKzshNH0/jqzjd0DmjZwkdRoYF2XUW3
	OhhCf1OjsJmL/UhCiUt7HG+68z1xkXo8Uy5hzGQJ+TqQ7YHgLLyWK422s4AA2bewpJ5CikCfeQW
	WYr8EFc/Y+cDPYsld0KZ3ri2SL5xUhnUqxNNqH1bEYSLqf9SSiplZWYZsAioWq0UfSTjIgbOjvI
	viVEQao7MCtTn7AVO/+lnjJd7pPBRugEXHUjZzg==
X-Received: by 2002:a05:620a:458f:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb422b2fa6mr1150430785a.30.1771239862530;
        Mon, 16 Feb 2026 03:04:22 -0800 (PST)
X-Received: by 2002:a05:620a:458f:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb422b2fa6mr1150427885a.30.1771239862105;
        Mon, 16 Feb 2026 03:04:22 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] phy: apple: atc: Make atcphy_dwc3_reset_ops variable static
Date: Mon, 16 Feb 2026 12:04:14 +0100
Message-ID: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=896; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UIwNr/KY2E+0ecUw9P2/kbSYuPp+7DKAt1dGLTzex10=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmuzb0vB7oi4pn/35nXpGsWObsKmVUpTChgV
 lEXrNPSfJqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rgAKCRDBN2bmhouD
 15lBD/9b781t2vSYMqy9NeIzD45ooVBI2AP+j3b68mE6MAzdwlE6C5SfFYOsu3FEwnFziEKY3Ot
 xIRRsy2mpvb10akE0ks+pptxAP9eYmh6U+XHUSWMR6oFYwIo78sDYt6IyFh7qoRN++jOCGn48vt
 zRPJDrj2Diq8Hw7/hDrmxzUHE6gPZfMZtx7oFh+bTkC6NqhkILSlE5nQ0QYnfko41bPtvPYvKz2
 kh0mIc8OiM9XH2OnMR0IYl40IXiOOG1gfaMymm1NU7XBU1k9yRns+CizJEf/KvQj//8ZNYfwUhp
 N7IpPE6T5IlmXt/E4LHw/HGU4ACBp6sNbJKcqovAmujuiFYH0e8Gw4QKEskOHBEjnvyJ4Zai4EM
 UCUvxXBG9Qzi0xIJoQ/jJa2dzzvEEJ8Udrwf7Dni8RVAGrcnv/LI2qxlk4KLu4pMF9xj23QXWqX
 8/NrynqeLalAte5MR7suZp5nveZdoTYrmt3cVwV7HvPT4bsjpbM0wDLqcwR1N0Mme3dqT3V3KM+
 ehQomFxZedoDQIIKC6E6VOvJPbi1e0Zoje91GCZ/XnNu9Kmn/zeUHlKIP4V2TjiVXXAvolgeQf2
 HFw95Z5fg6pUxYfEYttaKMAFqip4JgTbdGFcmBfhIPPLvVJbx9WL06wFnePz1n+LlVNrt0oMOH9 11DeE6vi6MJa5kQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJraWH7b c=1 sm=1 tr=0 ts=6992f9b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=V4RP2X7TQvdl7F27wUAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EJiZ-EsGW62vH5vb1byMiSzj6b35UnaM
X-Proofpoint-GUID: EJiZ-EsGW62vH5vb1byMiSzj6b35UnaM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX91huHp0jsLI0
 waXz8lLHaXKfH5P0sOeW4fBEbYYuIP2fAc0r/751U8m50xOHP+YUy8gIl5/1I2hg54xXq6Oh4Vj
 9tyIDJAS8OhfKZs7z5dAnxjy07SLdnWDpj0WuBurCM7jIK3xfkEK3VFEPrvJ7V86bXS5LXqk2OU
 66ioSQ5269fOlEarYCl9EC+xqhzHpJOVjmNosHcUS16Mh0FlPsczKmkqaG22yqsuT0ob0ZVWqOD
 VLUfdpl5npWUH1QtSGNITLwt5fLSnToKVHJC0xDizkERU5RK5NJJinRPxBKpzIQlTCGD8+x5cSZ
 6Rtuhfe4HN4I8EMVr9wBK8GstxOHgQMvzr1gXnIvUwBnIGQ+D+GO+Gjrsm14ikq2vgohxLDtOVm
 nR434r2edcIRlebfHPA9yqW8ZaHE66Yq1CfutizpOSXOXqSs6Uaq+fhnvsYWGR5R8fIoqzRZB6G
 h4iW3r1/S7HIDfmCaOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-92918-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A830142A14
X-Rspamd-Action: no action

File-scope 'atcphy_dwc3_reset_ops' is not used outside of this unit, so
make it static to silence sparse warning:

  atc.c:2026:32: warning: symbol 'atcphy_dwc3_reset_ops' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/apple/atc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index dc867f368b68..32d97226e926 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -2023,7 +2023,7 @@ static int atcphy_dwc3_reset_deassert(struct reset_controller_dev *rcdev, unsign
 	return 0;
 }
 
-const struct reset_control_ops atcphy_dwc3_reset_ops = {
+static const struct reset_control_ops atcphy_dwc3_reset_ops = {
 	.assert = atcphy_dwc3_reset_assert,
 	.deassert = atcphy_dwc3_reset_deassert,
 };
-- 
2.51.0



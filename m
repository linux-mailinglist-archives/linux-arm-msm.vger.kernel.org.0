Return-Path: <linux-arm-msm+bounces-92909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G8OBF/gkmknzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:16:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86033141E28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8950E302AD27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7B42C11F0;
	Mon, 16 Feb 2026 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNTetkbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qi3npRsr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138A285C9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233340; cv=none; b=aRIaThchOvDASQ71uMhpqVaSz1I9QMFrE+mYnaXN6GZPiS43eaJagRpuh3iUDYrr1lttMzgCZ/DEoFCMDIMCLTVrEiJevrguOAKZ2QWogojamGLUhlD348uibsyxqfCGJr+VYQHQouu2H2ZEf1MpD0n92//TMGfFcpCedYOYvkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233340; c=relaxed/simple;
	bh=/ikJH6De4AbfjOWMT8h6gmy+j7KyeZ/3QQ/KPQ5zSYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGbEzv7y6RdjZ6t0xp6WT6JdlUP8k/AO5Wg76oh2vtAN7pFxc2MDADUFcl6PW3mrvWCY/9r7ydapETz8UM3htJa7BwuoOW7k8IqRH+LhdsQHMbsHM0W0UJ3gAmailWWo4R2D6/IVVU0O8dxwNDpUGvTQbo7bCGAgmCN3C5ZKh4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNTetkbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qi3npRsr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FNgsCa3181118
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wbafzawO7kV
	+zq2LriGwy1ZpbXwDOmHKcABoZsl+zQ0=; b=eNTetkbddhwxClyWuSZDx66rpu0
	MsMcWHAY57w5Cz3q/1e+N//9qDTQwa0wJMl5bxtIMeamosGPFISFl3tSeZ3jdS0e
	jAL/IidNxgyxkWpSJew66gYKaIHvY3U2tRE+lvc0dXUYZY8BH+XdYxk/J3T2cW9k
	fWFyMhBMqNTTOjR57F5e/NNUxFx8G3btQujz+Rv6aIMWVlI8diITBHzGhqUi+YhO
	0QbVxRFAK9qmpxPezwO3SvQqodLE49kFL5/wT0mTe2i6cargHd2Fo8OAtvUUfszo
	e32rZrf2QDpLJ0BxHpkVihj1JogcyOvKPKZlg4+lS+zi9frW7iLjQzj4JRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sm1t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so194081285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 01:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771233337; x=1771838137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbafzawO7kV+zq2LriGwy1ZpbXwDOmHKcABoZsl+zQ0=;
        b=Qi3npRsr/sSY5aTdOO8TKXNung/wb47PAo1kppIZ1qVcC3qWuK8545TYjeZxjXfiaG
         SSJjI+ssTdur6S9liI+TRddlElUnIRuTeGnTXs3+IU0+QfITP0tL0vKTkQt6rfbPsg/S
         jXZn5IdJplSdGTLDhZt0NEOHfv/E9X0VPs01JyCbO+jc9wkT/ffEQxEr3MRHqLUOsDTV
         afi7UXbz0JK9hJho/YKemrlojsibZsbQVO2hJxpcbZ9OOGjD4iGy+ILs0iAjMy3OJsR1
         UgLLVb5fAOTM3Bvv5ouVZadY7gSMoRNfHiQpXHyrLJ17Vc7oBTZJriy6SYq23sFD0rzf
         HF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233337; x=1771838137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbafzawO7kV+zq2LriGwy1ZpbXwDOmHKcABoZsl+zQ0=;
        b=ZkaBTsU+dNtptrUIHfQSCf5dZNJ/iV/v/XFaqvOzR6MfydmoSlMtGW4RIF8rtv2cN0
         uphLfnx2XDsqSdvoi6ySaUyRbU29RpfnXL3d/U6RQ6bG5ZVsfe7DpT7UJnAcEJdnVU2R
         M9SnEF8bBAMhF8IZz1lOhg4/Pj6fUQQLJ/AKBogoZtUQvwf2Z1qAHyL+6quYNNfKvz0z
         d/4Iw2PNGObOEsYjHwVP0mYwvprhxd5ypIi65gPT29JOEeCxK97K0B2F79IGGzlbIU2w
         zNrcRwOlUX+9GYWBbUKV6Vr8kyn5+n6NGoNKteQxuOpO2T8q+HtE8zuZLdP1BkXPgii4
         NL9A==
X-Forwarded-Encrypted: i=1; AJvYcCW9d3fxQ5TRQSSsg3nxjQ/cnEh4a1GcB79GVmKj6xns8O6I9ZpXvh5UFL8A9SLMvwecLWnBZr3SfV3RTNf/@vger.kernel.org
X-Gm-Message-State: AOJu0YxoXFZI9XOFQyQ+2Z0ZBdXFA7z1LeBb8x+VHwi5VeqLhzBQxrtu
	XXijcUFVlmF6CX0yMFKK059nd4R6bFj+FH8KWZHWwhWKAUezbPknTFrMjEDhLpo0xm4vn83wXoy
	ONg9gGbACFCs1MvxTERjzyISdsrwxJr3zaCTdL4Y10e7IkvObaG2c2JdYajrRAuUHjMqC
X-Gm-Gg: AZuq6aJZYlp2FLGVMZyTgtGLlSvYs92RzAsxIkLRHDfnIZUePz3PvJWDY97NqsidRBc
	qTUijXWdiwBKKDl7m/YcZIOmxZUKvEUO3oX/pPKnI6uquZ4htybnskNRFdBGEuFH5sPCOihJhz3
	e6JSemWgYV53lFzSAsCq58/p70T9AWHoivzgqD3pEQ/UR7XlgQY/HmsqzLVxI70XL6Udm7REyRy
	wY0zSnNflm2Q4/WGs03gaHweMTozRYFj7hBQ6AWzgQXz97WbWa95rGL2mKmKvcEMsUe1dZ55rEm
	ZGh/9rIXYcNOz55Qwwz4iwyu+bB3cBdlkyUSRbiDSzZktsHf5cSjTAslWPFh1tJzPmqN1cdzCZE
	OaGq511M+jrZ6N0wKaQxmN70ZqD8EVste0UzYRA==
X-Received: by 2002:a05:620a:371c:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb424bdcf4mr1130625785a.78.1771233336844;
        Mon, 16 Feb 2026 01:15:36 -0800 (PST)
X-Received: by 2002:a05:620a:371c:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb424bdcf4mr1130623785a.78.1771233336201;
        Mon, 16 Feb 2026 01:15:36 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm23110552f8f.34.2026.02.16.01.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:15:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/3] firmware: qcom: scom: Simplify mutex with guard
Date: Mon, 16 Feb 2026 10:15:28 +0100
Message-ID: <20260216091525.107935-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=/ikJH6De4AbfjOWMT8h6gmy+j7KyeZ/3QQ/KPQ5zSYw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkuAvS+17eCq6Ioba+tiCTn6eGAHmhezjVjexc
 bOPLKuAttmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLgLwAKCRDBN2bmhouD
 12bMEACZtDf7H99j751dGwDiD9yr+E4Y1o338eBn0zxEOQDT5rFCRxHLBt50CuwA1ZFEPD/vNqX
 JhbnGZguZjmMa4SfldqkJzRYywZcWNMyvxQg0hDR7XqhxGpuQWDvjOjO30YqntTL5QfVpv+eQoi
 jS85l5uHfUfxzk+nql+2Njy5WIjLf3YX0QYyKYXqQWXwOxuIpiDe5gyqxKm1O1Gq7PA6iJJMp4w
 pkA2vk0z2O1B3+P/1si5CQZ77nitSDtWeNttTtaDYcGTUF0MohebvSu+da+2BBOPnjpPsijNMo8
 07s23OO2kydqb/xl7U3tdGSjy20KLurSQ1homV82J78GmAAmkssXhO0yajobw9IvIi50K9h5nc5
 A6yy8pxW46eEVE+XL2xoe6nlCJ7+CgFJgO8tBC1AQOb6uHoYuq3V1N0a+/dcdvk7vD6Qtbz0+pS
 TKaUHKaA+XJqwocoifWHkMowbkD/naCSTJN2qmNbldKikij3hwkf2MJYGYfmmpv5rSyGUpcV3+z
 gLPWWDIs5wbb0cxvIMr3eODvOia6ImQzRLPOxOKyC9fhgq1Byfb/dyqOiCekiyKFNICvPhZN58B
 30z2szP50tNKoxrWO2PQVg3YJIlGpH2MylxgkZ74+P2vDMAa6JkSw0eGRpqOg62q1xALw4205PD Er3jMmh6HELJ7PA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NyBTYWx0ZWRfXxMN2QJtq9bNO
 t7Zp+rmWq55IK7JUzNg6hrc6XycBf1BWOoNSFp2s+lSTs9ZBEcTKHJq7dXbK4Z8nAeTb+pfUitd
 XVgWhXd2P5SU0lug5j0X3Ns+t5yY/oiV7tkflDBqPTvBIkvB2NLsVdsrnAUfCSWs2HKKw9MGf0+
 khWlufG16/rUv2LlX7DkFopTNUcsQjCI2O4DvRhgkCzTNeg5YXY2p0ZMTsPycJCJkJk0sd450yG
 PKwFoVBjvJqeJAUkXUvILTKFjA2pmlqrZpM1p17X2Wufkw0xJ5jvSm4Xq45z5jYoRQGcEO1UGvA
 snIqvPb1nD1eTWwq4W4zzmHTXnoJZXuw8QpVq7eI5g/sJcQOz87xTlk85lIe9LdkOlAnM7XhE0+
 WgJT6840uggjPcWnw2VRcUsa7hIg9eubWSo6sqJHpju1rM4NrQSX+PA6T2v1UsdJ/gvpwTWjrZX
 qHIkMKrTVHCCAhpc8Xw==
X-Proofpoint-GUID: tob9f7N7CQcdsMH2MGpgr_0W6ylnKWFQ
X-Proofpoint-ORIG-GUID: tob9f7N7CQcdsMH2MGpgr_0W6ylnKWFQ
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=6992e039 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=qlTs7ZDSZxy6MtpO9yoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-92909-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86033141E28
X-Rspamd-Action: no action

Simplify error path unlocking mutex with the guard.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
None
---
 drivers/firmware/qcom/qcom_scm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55..f1947025d8b5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -199,19 +199,18 @@ static int qcom_scm_bw_enable(void)
 	if (!__scm->path)
 		return 0;
 
-	mutex_lock(&__scm->scm_bw_lock);
+	guard(mutex)(&__scm->scm_bw_lock);
+
 	if (!__scm->scm_vote_count) {
 		ret = icc_set_bw(__scm->path, 0, UINT_MAX);
 		if (ret < 0) {
 			dev_err(__scm->dev, "failed to set bandwidth request\n");
-			goto err_bw;
+			return ret;
 		}
 	}
 	__scm->scm_vote_count++;
-err_bw:
-	mutex_unlock(&__scm->scm_bw_lock);
 
-	return ret;
+	return 0;
 }
 
 static void qcom_scm_bw_disable(void)
-- 
2.51.0



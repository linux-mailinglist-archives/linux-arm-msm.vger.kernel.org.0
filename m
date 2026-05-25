Return-Path: <linux-arm-msm+bounces-109564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPXZLlTtE2qGHgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:33:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0135C67FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60E613051153
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A6E3A3835;
	Mon, 25 May 2026 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhflI4xY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSe4PxwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5839C01D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690597; cv=none; b=dkJzEIBd88j3BoUnoglSZtgwWAUF0OdBqdebf/P0kbQdd5+2O+RmZzY3XaIn1TVhhMQ1xmkvkaJo0hS3DQVkPzVStHiH5tRSWenWXbvV/HdS7wfXKb6Is63WHCh9beUPXZboKDMgeND992UnyOsLvbJC1bQrZYWDN+Y61x6Yps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690597; c=relaxed/simple;
	bh=He/ks1fl1XY3Od8AiQUMNJnoXU/UQ0LdPt6+yLk3TUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmJZMlYR3RV7rHpWK2e9dmmXqSb5eJ0wGtNxcGMBE7nJPn4rkZ+gNUzTaVBJqh7kedeBAgLzdSPwYfVLxN391299rjK718jmVFqnGV1Kr+Y8O/q4J40KGGP+xVos/tPf3tAhmz3Kf+kKpMLBz1oZStwMk1qzOor+mlQOGT9JFSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhflI4xY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSe4PxwM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P2vMq6555501
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef27iEQ/QJT5/88Q9MJdNPpgnDhI0fjuhKF1bIzsm9c=; b=IhflI4xY/Sgne4c/
	A83XyTb2xIiViFxyLk4uNX0IvZ6UVae6Do5HKjC6gtmOzekm5rF53kLFT2wbupJ0
	AJDWvonvot2R1zI22qDHC48MfZTQ/rC0GMBVXBUn8WCEGeOwQ4zj2m6gz32837pB
	pJQLeBn8EY7kGsxE7Kw9GcMBBcezk+DHq4cVmYbPb8s5u1v9aM3vwbva3P/Ls70y
	6oxwE1nUfpaLq2biIuAvnjLglPPvNujlA2Fh+7HjqmtBD1epADN9tHSxHET2Bz87
	qTvk10NpaaHcpN5rahU3ffNFhF0EMMnllbxnhPOrYlL+4lI3V6ZRna/0e5APWTET
	7cIESw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fw696-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fded513994so2606652eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690594; x=1780295394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef27iEQ/QJT5/88Q9MJdNPpgnDhI0fjuhKF1bIzsm9c=;
        b=JSe4PxwMh2vl5CfDZAHOklV9+oeqr03CpfFryySMXhRihNSXT1cLyHO5bjq3TQl3qm
         aYoIg+cCGhPzXzj71eCM72/xJCg/272oSZsJES/M+LIXuAySZ7oh/Aaeuc1mA42ZdlFF
         cbAAuVj4qQY+SduZ2doxo/kVgVbZ4TC3U62fqHW0SphLoJlErj82EAUKDE3OCzMBCZXk
         YX3H/vo7jse4hjgh2WOW1kK/49VpKFzNOt79DD80Ji5zRXTkVq8moB8dolUdqTnw47c7
         Ub8aso6no4BZk3ewyD98DZfu9xhJGve+gujXAs3/ldQ8ltB9nkTvMGPZh3dGaKkKCGvG
         DTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690594; x=1780295394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ef27iEQ/QJT5/88Q9MJdNPpgnDhI0fjuhKF1bIzsm9c=;
        b=GudbkKOuCqnxGywBsRDddi1oqdXsg+UIrXqMZoqyekYFSbvqzesrfM8ytJX4Xyrv1O
         DJAqRN5F/FxzkNfv33rgBfHoZ2nuuJSQ+Yrhl9UQN74Y9o7xdROSIQlRwz3ojtcs1m9V
         CJO1MaWMUiHA0Yy9y+KPIuTPUtlmBkicaun+2dE5j3r0BdpwSr5RoxtVtKQmY9A2sWK5
         wcfSjpKKAGXLr39jLUoECkhehEVkd6pNKvuDC6j+hnrl6Oisx7OiX7UTQJEIfA2jkJVl
         UzJk2rd2ZKgRbj0QE9qKVBF9ucwDTFS5OsTWc1xNNLvoitU/CT52/9qW25SD/U8CwAIT
         SWVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FDJ2QhvOLxwNp8Bu5r/p4AX+crCHrXKmNm0h2zA5zvaKzSLDf9JNnMUyvVIORPLXOAOITtsgc2Fx2X2C9@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsrrWRN6DiIUS3xhBtkVDWqygzoMkyhC02WzEihkwKf51ym3q
	xEA0kCkD5K7XwU4VNGKZEM6wJ9gjb7ViBV3PHVVUlN9hikD4HmEkKbirdORhtzqmYYCXQxNBWax
	jjs2SpOyfiXaoTY9SN7g1M3+qRa3iKv+2NEGcUhWqO/zWU3WoJbpqN3koOJQNs8GMxqID
X-Gm-Gg: Acq92OFxi3KGhFiiieVuCyrnkbbXVgsxIbfSlt5GHthw4ctTjFCgqQFMoBwC4guZTTa
	NXQxIlSkEjVQ9EocQHTEQcYHBS9mjIgXHFb1xmNdCETPLlJTtN+slTYjRxOuO+VOQcPbTwYmcom
	5prE4sjUeCbB05VhDBBmAFW45hokB3VVLEeAJfODudEBNvLVgQ5+xAenKEQexH5I//gcTR+xBxI
	EOUmV6goHh1xW6FU6qbIlSHIWW+3JYLJmi/SOWWnrA7tXjE4WPJcoIODMjPw4tMfU+Ogjj8iVyN
	gUTYhlUCtPxvjOecCZDeUMA2USj0Kwfh1AR/yyXwnzC9huCQKBjNce7wtHS16yt71tCWZZzvho2
	kB/VMqqqioVzBWoDoe7hUuw5R1ZJ0kxPsVjGE3Xtvs5DjqoL2JhNA7ujSuOpxS9oWR9QzmpMYbx
	bvjIT8qzg=
X-Received: by 2002:a05:7300:641a:b0:2ea:ed3e:13b7 with SMTP id 5a478bee46e88-30449024d0bmr6237785eec.7.1779690594440;
        Sun, 24 May 2026 23:29:54 -0700 (PDT)
X-Received: by 2002:a05:7300:641a:b0:2ea:ed3e:13b7 with SMTP id 5a478bee46e88-30449024d0bmr6237765eec.7.1779690593884;
        Sun, 24 May 2026 23:29:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045223103bsm6918036eec.16.2026.05.24.23.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:29:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 24 May 2026 23:29:46 -0700
Subject: [PATCH 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the Maili
 AOSS side channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-maili-soc-binding-v1-3-fdf9f9ff1b23@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
In-Reply-To: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690588; l=853;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=TvbhNH7tixvNZJfOsBq6jkZPUGzlohXVcj37szTmhfc=;
 b=TqYQsOXL8gjhX65AfW2kmwivMC77/JP3b0Ene70/VXQ4kMLxaUh6jM65nrJpdres804eGATx/
 Sw1dYSDWvfwCV/BlGfGb438Rq4P3V/JP/s/bb+fardoZ3fKM8mdTsc0
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfX3CZPARPzwv1a
 vsO+ZTzlju+NJnkV00ROl5evgKX+eOV8BoMLda6vtuioKW5aWmSx78gShZ0yerIEb3JvK+Me2Jt
 nZPOv8OdqYPR/wcwMfMbjN04K7Wi2rzyrQlduXmgmGDufThsmp2TOgS8V9RkQAkMdL9hUh14cAh
 yU3J1K4SrXf6zM/H4OH5eHwGdGM3ftxjHWQ3KjhAWxvZIfDNMiy8TQfKaMQY5IxbKXL7of6RkD5
 qYHQrLEVpeK1sUuI/IJYhLsKZCzS3AoGzY5ps6q940tpeB4VXJnpdjjbHGNQzZjpYLAuXrCgPco
 tgxIZSBqsJ5U1YxCJElYuUM2wazs5OmyO5z+VqiM8OeNvPEaq4jtsFAZATrtDAtjHHZJGRTklFM
 EB51Lfm/Rvpsw+0DKa7rdAFlGezLoNKvIDWm7vgE+H6NLQbG3sbTeHEgmIOywWzAemxY4SOfWG8
 yM85XFKtlDzdd/LxRug==
X-Proofpoint-ORIG-GUID: Nifj_mvtYwrGz1Nql92d1z7Iy6xTzgN5
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a13ec63 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Jk4Rp6uFe9xYLVmVXOEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Nifj_mvtYwrGz1Nql92d1z7Iy6xTzgN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109564-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B0135C67FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Document the Always-on Subsystem side channel on Qualcomm Maili SoC.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 8eaa04431d74..9f9d9bcb66c4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,glymur-aoss-qmp
           - qcom,hawi-aoss-qmp
           - qcom,kaanapali-aoss-qmp
+          - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp

-- 
2.34.1



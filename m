Return-Path: <linux-arm-msm+bounces-93598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLesIIoFnGlk/AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 08:45:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF728172CDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 08:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BEC730057A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0DA321F5E;
	Mon, 23 Feb 2026 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHWPIVDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixzRQvbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9557344DA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771832672; cv=none; b=qb5iW9FRSV4u8ZmN2D4ryvViYa9D1A2m7zlfXfwlm3YLZChcK8uSEsccY7fqh/nRaWTX5geWx4KIyGbgfk8J4t57O4W5ZkZdB1YqKBwiFiF3VtnpbUJtmd9mcz0gsrfyjZz9+UnFIKPa9tNcmiYPRoBMkpddLOiy27UsEey+oGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771832672; c=relaxed/simple;
	bh=jgkeVfogsKibUw32YiJNH1gImfBnVvuN8f62J8h7jPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bHaXX+WBK3Pt1FCZ44otOgNZ8SlQNVrSsE/uSCXfzP2eAGHjpQuBg1qG8bYaabBj7MFZyqpYtFTbiQy6t5cRAlihwGUqWWPmGP+bnnuJ54CJAYmKDcO6vt7u9M1/VoVomlT/pOGL3B7uhRGWXnk9TMqEqrjAe3HKyiVUM0qLzh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHWPIVDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixzRQvbw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MFQjHY331517
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 07:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iowA+Ua64J45MYhgoyqiYZhXrtYmAx/E8wf
	+NJMec2U=; b=gHWPIVDEEj02Gk1vR/P9ONAqnAVajDdlSh1xPdwHqnJCNwzEed9
	Yp/90wakmQLWmou4gzMPaTqYrNH0kOA88GHAT5UO/wRRpxn0IM/Tam333CdT2VJr
	Cdmanj1EbQUiXT1Cw2w4d6oXAef3mMgEWiFTTjBUWTij2rZDvRzv+XRzPijgpeii
	gvlpnIYv3iHq7BPPw7LmXgKZNN89YnnUmCcloLdwGtvlS9qBr1lYBmO7hGZgxaU5
	YtmSs9Q8IJjA8MtihqtqVSxBxgP2fe/fqzoGv0mBvDEcMFhFSj9hkaFhzTdPnEWi
	uVapOHsx2mLq8Lvqhs3+IDrbWS2AlD5tRwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603ktfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 07:44:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4817f3c8so3608879685a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 23:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771832669; x=1772437469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iowA+Ua64J45MYhgoyqiYZhXrtYmAx/E8wf+NJMec2U=;
        b=ixzRQvbwPiZz89UrW912KwA+y3efm5Amks912IllYBHc//Nx0YkA+ZNagYlaP3dEBk
         HxyUyDxQH903UyoOLYgtQ1V6lRIROJfu8x9EB4y3EcyMha4KNIdmXp6jbJTmyp3EJgWm
         FmCI2UVXs2DnCTYC3S6M5VULA7ZaY5K+I94iqyMILrVBNDD8JrRESxqsqvE5iRvoFmOF
         l2AEjnjFZibZuHKbTBNreabQG0jTBGylQvGSbeWgWWBzzzqJX0Fs1rv85q06ecdeQ8Jt
         pdlXKozZw8pBwO8doZrckiyyfi7XQcCwz2peRtHHE/9+OXZ/DVl1HFoqy4iMEffkN+n/
         1MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771832669; x=1772437469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iowA+Ua64J45MYhgoyqiYZhXrtYmAx/E8wf+NJMec2U=;
        b=oitP5VmEU3ZBH9f6DzjUjI50POC6Yom7k501/QBM1CfP7bLkxjSG/uHwnvC0+/dtDX
         dJDsmqO5znXA9pFolXQDxzoVj9fP0twmW4cqzClfy8jP8O6Bwj7xs6NV68kQ5mqle7cV
         gSxvrjsZG7REFoO4btxUY9+okolewQo6CwuuKlP3DJIs3E5QHidGXVozPBV/EWeRDyIw
         edcY6tPaEmzdA4zfh8UoS92P7Fiay8wT20L8nOKNzpRle7FQZS1DY9penJ3sRKEykri/
         d4pZZfzsPR5x5UI5glQZ0A3hj9phg0/+G52j9D/kpTlrpXV9u0tefg93eOCRdp2y+czJ
         hKFA==
X-Forwarded-Encrypted: i=1; AJvYcCV/8HZYELSq0QYHMnQBGbOaUyDjswFacrJWlYbUkw2xJETwh++z3bNUSKWS6k9oXkMOXEer8oVrOkYNGIjg@vger.kernel.org
X-Gm-Message-State: AOJu0YydINQOOCBf+1jFB+WWdiXXb8QNhGRGDDcsEa3xvP6ZqN4hWm0x
	B1L339enjcDmMdUE3A/SO8OrWO0SZljS5xDJd1H6T52WEwP8sht9FJsriny1OVuL91YXDdJEtFG
	GXElXGDKnp/ySy5XDLnPp8jPmYTbEIGnRoSKnwBmQ3v9koRJ8TSG7ul/U5RGCgeT2cnqe
X-Gm-Gg: AZuq6aJlRbsweuww//VI1oBGL07U+Krm6UhEicTYNI0JwK3C7Rz977seSRFiQpKoRVb
	U/cI3Eec1yQKbgqUKPmrehJx6JPLwY5N54zEitTw8takgzhApAWjnP1luqXOBvUwC+yGGMHARh+
	9KRR7bc9XDgG947uSJC/Bd6k4lk+fOXJEBJC209RQ1g/CBP+9OpKmz2kn+RB2TpXgYAny/0WsO7
	5s5PZs7aReIINzc52TEqGKtjdh2snq/wY9/HuCrIm4uxRusS7i2TCKnfo9topj5CCXgKItDqwGs
	zs5zKQY3PQSUMWz29ZYFSsL/zzPRv+B21La4oGzzY0nNFWr/tDYXQuVgabYsXwGh+2NZsyHtJ1m
	kSSEwDVDFHrRlZbniWizJawxsjgvyfZHP4hsufQ==
X-Received: by 2002:a05:620a:3711:b0:8cb:4d18:bb61 with SMTP id af79cd13be357-8cb8ca854aemr952448185a.72.1771832668896;
        Sun, 22 Feb 2026 23:44:28 -0800 (PST)
X-Received: by 2002:a05:620a:3711:b0:8cb:4d18:bb61 with SMTP id af79cd13be357-8cb8ca854aemr952446085a.72.1771832668298;
        Sun, 22 Feb 2026 23:44:28 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4e8d392sm207887135e9.2.2026.02.22.23.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:44:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles
Date: Mon, 23 Feb 2026 08:44:23 +0100
Message-ID: <20260223074422.18468-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9181; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=jgkeVfogsKibUw32YiJNH1gImfBnVvuN8f62J8h7jPk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAVW3VEFMPxlrxFTnpVDnfoxs11pis5Z6cOE1
 3V3qvjL1HGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwFVgAKCRDBN2bmhouD
 1wHVD/9frN8xK7Z62PKhsTq3kYmWuwK79oF9sYTDWUzQJNrDJYEdINwLfJ+S92Wd4qSSKwldFBn
 luUmdzZyuI/M6yRpfc3MDbhTjPhOVYD758+S52YO0SSnpAVWybSZBXY13ilgxuaLm/S8hJjenQE
 eeBnjb6jknOmA0b4SRwArRZWa5GEbwhs3KiZfwzh9v0fwYaFMr/vi2LCj8gYaNDEaW/ACA3IAG+
 Ze0HJzXBD24FbygXNMzwxxzp0FxDe9VHxz5E11ZyYlU63065An8H62yQjwlLd2vmzjTWimDuWYj
 K9dXx1wMh1i3Csqu5At9mDjwyEbMrT1Y9aq+iDog4QZcNOWeArRAIcvEjntNppba6erehXPKpAN
 dCH8yu+N4TfglUbvYCiFV77X7xowU9lt0Wk2woPUUPJ6gjvazsFCnG4i0GjcomwkUd6EcVr9gyt
 wK+/9lY0N4F/xB6CCLwihs3DrZK+xjykM89a01uqCTQ+1BhczId15Wp0wYmtTOEuyAW1nHqlA4t
 pi+pOKMcP8jlSttyH8UYG1jSNyq3u72TpumQDURpyOttukK7c2ddfrbbTtr46Av19z/8GT7Z+HL
 Mxz+DCExxv0+3lkyxzeclUW3M0e1iIz36EZaiuvOa+dMFQsGPMKDeexyftfrcY6cKXI2zsXt1GN iS63U+UJ0UAT64A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c055e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_CBG5LNAS95wvtelTLEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NyBTYWx0ZWRfXxhiCZ0LNjn3j
 A7UfzWHsRXsjtSSk2hErJXPLRXJb6Sh0oP3Neq9fKkTdPJBe9lXJKLv4eJUbh/Y1Q0cmU2NGbhm
 evU58L/wiBBqeptetCkt7lGDZHVV5n34iG+VktjEGQSOUSjZ+Yl2zqoJn5ZvLSgAfWLRk2zUPeG
 qIcEFeGxl2TQ9glSkNI44l+P3haHTbNdLiJQIFRRBc6t1z2zTIvCk+0sYpbFOCopIs4bYpgJq5J
 YUUTwXE2Zg6S7yxTgWzSr21Jk6swGN1f6k+z0KIN8ZFOiZxLUN7FzBoSCBRcqty9NYFsZVxACTl
 MHfJtPnNkZEI11Te3AehfFY5FU7XbjThRoANxyrF2DvyGvkurZwh5OQAmIQiTl6zFSaVsNq9mwm
 cf9D9iHju6RLhhSWB7iXiwwj575cV1eiZdjtLNW8/wEGGpg4f2Y4NhOKN+FUQK6d8YFOz+emkLI
 EbMuZT00E18NG+x29RA==
X-Proofpoint-ORIG-GUID: CQoLAI7muEQNVjUVgXNP8ELOI-ulaS1b
X-Proofpoint-GUID: CQoLAI7muEQNVjUVgXNP8ELOI-ulaS1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93598-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF728172CDC
X-Rspamd-Action: no action

Move compatibles for Qualcomm Kryo and Oryon custom CPU cores out of the
enum into separate one with deprecated: true annotation, because these
are too generic names.

These are names of the families and there are significant differences
within individual processors, e.g. Kryo6xx can based on architectures
from Cortex-X2, A710, A510 to A78 and probably more.

Just like other vendor processors are differentiated, also Qualcomm CPUs
should come with specific compatibles.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Do not touch Krait and Scorpion because no consensus was reached
   about whether there is a final model-specific name for them.
---
 .../devicetree/bindings/arm/cpus.yaml         | 290 +++++++++---------
 1 file changed, 147 insertions(+), 143 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 736b7ab1bd0a..700255e9a002 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -79,149 +79,153 @@ properties:
       All other bits in the reg cells must be set to 0.
 
   compatible:
-    enum:
-      - apm,potenza
-      - apm,strega
-      - apple,avalanche
-      - apple,blizzard
-      - apple,cyclone
-      - apple,firestorm
-      - apple,hurricane-zephyr
-      - apple,icestorm
-      - apple,mistral
-      - apple,monsoon
-      - apple,twister
-      - apple,typhoon
-      - arm,arm710t
-      - arm,arm720t
-      - arm,arm740t
-      - arm,arm7ej-s
-      - arm,arm7tdmi
-      - arm,arm7tdmi-s
-      - arm,arm9es
-      - arm,arm9ej-s
-      - arm,arm920t
-      - arm,arm922t
-      - arm,arm925
-      - arm,arm926e-s
-      - arm,arm926ej-s
-      - arm,arm940t
-      - arm,arm946e-s
-      - arm,arm966e-s
-      - arm,arm968e-s
-      - arm,arm9tdmi
-      - arm,arm1020e
-      - arm,arm1020t
-      - arm,arm1022e
-      - arm,arm1026ej-s
-      - arm,arm1136j-s
-      - arm,arm1136jf-s
-      - arm,arm1156t2-s
-      - arm,arm1156t2f-s
-      - arm,arm1176jzf
-      - arm,arm1176jz-s
-      - arm,arm1176jzf-s
-      - arm,arm11mpcore
-      - arm,armv8 # Only for s/w models
-      - arm,c1-nano
-      - arm,c1-premium
-      - arm,c1-pro
-      - arm,c1-ultra
-      - arm,cortex-a5
-      - arm,cortex-a7
-      - arm,cortex-a8
-      - arm,cortex-a9
-      - arm,cortex-a12
-      - arm,cortex-a15
-      - arm,cortex-a17
-      - arm,cortex-a32
-      - arm,cortex-a34
-      - arm,cortex-a35
-      - arm,cortex-a53
-      - arm,cortex-a55
-      - arm,cortex-a57
-      - arm,cortex-a65
-      - arm,cortex-a72
-      - arm,cortex-a73
-      - arm,cortex-a75
-      - arm,cortex-a76
-      - arm,cortex-a77
-      - arm,cortex-a78
-      - arm,cortex-a78ae
-      - arm,cortex-a78c
-      - arm,cortex-a320
-      - arm,cortex-a510
-      - arm,cortex-a520
-      - arm,cortex-a520ae
-      - arm,cortex-a710
-      - arm,cortex-a715
-      - arm,cortex-a720
-      - arm,cortex-a720ae
-      - arm,cortex-a725
-      - arm,cortex-m0
-      - arm,cortex-m0+
-      - arm,cortex-m1
-      - arm,cortex-m3
-      - arm,cortex-m4
-      - arm,cortex-r4
-      - arm,cortex-r5
-      - arm,cortex-r7
-      - arm,cortex-r52
-      - arm,cortex-x1
-      - arm,cortex-x1c
-      - arm,cortex-x2
-      - arm,cortex-x3
-      - arm,cortex-x4
-      - arm,cortex-x925
-      - arm,neoverse-e1
-      - arm,neoverse-n1
-      - arm,neoverse-n2
-      - arm,neoverse-n3
-      - arm,neoverse-v1
-      - arm,neoverse-v2
-      - arm,neoverse-v3
-      - arm,neoverse-v3ae
-      - arm,rainier
-      - brcm,brahma-b15
-      - brcm,brahma-b53
-      - brcm,vulcan
-      - cavium,thunder
-      - cavium,thunder2
-      - faraday,fa526
-      - intel,sa110
-      - intel,sa1100
-      - marvell,feroceon
-      - marvell,mohawk
-      - marvell,pj4a
-      - marvell,pj4b
-      - marvell,sheeva-v5
-      - marvell,sheeva-v7
-      - nvidia,tegra132-denver
-      - nvidia,tegra186-denver
-      - nvidia,tegra194-carmel
-      - qcom,krait
-      - qcom,kryo
-      - qcom,kryo240
-      - qcom,kryo250
-      - qcom,kryo260
-      - qcom,kryo280
-      - qcom,kryo360
-      - qcom,kryo385
-      - qcom,kryo465
-      - qcom,kryo468
-      - qcom,kryo470
-      - qcom,kryo485
-      - qcom,kryo560
-      - qcom,kryo570
-      - qcom,kryo660
-      - qcom,kryo670
-      - qcom,kryo685
-      - qcom,kryo780
-      - qcom,oryon
-      - qcom,scorpion
-      - samsung,mongoose-m2
-      - samsung,mongoose-m3
-      - samsung,mongoose-m5
+    oneOf:
+      - enum:
+          - apm,potenza
+          - apm,strega
+          - apple,avalanche
+          - apple,blizzard
+          - apple,cyclone
+          - apple,firestorm
+          - apple,hurricane-zephyr
+          - apple,icestorm
+          - apple,mistral
+          - apple,monsoon
+          - apple,twister
+          - apple,typhoon
+          - arm,arm710t
+          - arm,arm720t
+          - arm,arm740t
+          - arm,arm7ej-s
+          - arm,arm7tdmi
+          - arm,arm7tdmi-s
+          - arm,arm9es
+          - arm,arm9ej-s
+          - arm,arm920t
+          - arm,arm922t
+          - arm,arm925
+          - arm,arm926e-s
+          - arm,arm926ej-s
+          - arm,arm940t
+          - arm,arm946e-s
+          - arm,arm966e-s
+          - arm,arm968e-s
+          - arm,arm9tdmi
+          - arm,arm1020e
+          - arm,arm1020t
+          - arm,arm1022e
+          - arm,arm1026ej-s
+          - arm,arm1136j-s
+          - arm,arm1136jf-s
+          - arm,arm1156t2-s
+          - arm,arm1156t2f-s
+          - arm,arm1176jzf
+          - arm,arm1176jz-s
+          - arm,arm1176jzf-s
+          - arm,arm11mpcore
+          - arm,armv8 # Only for s/w models
+          - arm,c1-nano
+          - arm,c1-premium
+          - arm,c1-pro
+          - arm,c1-ultra
+          - arm,cortex-a5
+          - arm,cortex-a7
+          - arm,cortex-a8
+          - arm,cortex-a9
+          - arm,cortex-a12
+          - arm,cortex-a15
+          - arm,cortex-a17
+          - arm,cortex-a32
+          - arm,cortex-a34
+          - arm,cortex-a35
+          - arm,cortex-a53
+          - arm,cortex-a55
+          - arm,cortex-a57
+          - arm,cortex-a65
+          - arm,cortex-a72
+          - arm,cortex-a73
+          - arm,cortex-a75
+          - arm,cortex-a76
+          - arm,cortex-a77
+          - arm,cortex-a78
+          - arm,cortex-a78ae
+          - arm,cortex-a78c
+          - arm,cortex-a320
+          - arm,cortex-a510
+          - arm,cortex-a520
+          - arm,cortex-a520ae
+          - arm,cortex-a710
+          - arm,cortex-a715
+          - arm,cortex-a720
+          - arm,cortex-a720ae
+          - arm,cortex-a725
+          - arm,cortex-m0
+          - arm,cortex-m0+
+          - arm,cortex-m1
+          - arm,cortex-m3
+          - arm,cortex-m4
+          - arm,cortex-r4
+          - arm,cortex-r5
+          - arm,cortex-r7
+          - arm,cortex-r52
+          - arm,cortex-x1
+          - arm,cortex-x1c
+          - arm,cortex-x2
+          - arm,cortex-x3
+          - arm,cortex-x4
+          - arm,cortex-x925
+          - arm,neoverse-e1
+          - arm,neoverse-n1
+          - arm,neoverse-n2
+          - arm,neoverse-n3
+          - arm,neoverse-v1
+          - arm,neoverse-v2
+          - arm,neoverse-v3
+          - arm,neoverse-v3ae
+          - arm,rainier
+          - brcm,brahma-b15
+          - brcm,brahma-b53
+          - brcm,vulcan
+          - cavium,thunder
+          - cavium,thunder2
+          - faraday,fa526
+          - intel,sa110
+          - intel,sa1100
+          - marvell,feroceon
+          - marvell,mohawk
+          - marvell,pj4a
+          - marvell,pj4b
+          - marvell,sheeva-v5
+          - marvell,sheeva-v7
+          - nvidia,tegra132-denver
+          - nvidia,tegra186-denver
+          - nvidia,tegra194-carmel
+          - qcom,krait
+          - qcom,kryo240
+          - qcom,kryo250
+          - qcom,kryo260
+          - qcom,kryo280
+          - qcom,kryo360
+          - qcom,kryo385
+          - qcom,kryo465
+          - qcom,kryo468
+          - qcom,kryo470
+          - qcom,kryo485
+          - qcom,kryo560
+          - qcom,kryo570
+          - qcom,kryo660
+          - qcom,kryo670
+          - qcom,kryo685
+          - qcom,kryo780
+          - qcom,scorpion
+          - samsung,mongoose-m2
+          - samsung,mongoose-m3
+          - samsung,mongoose-m5
+      - enum:
+          - qcom,kryo
+          - qcom,oryon
+        # Too generic, do not use in new code
+        deprecated: true
 
   enable-method:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.51.0



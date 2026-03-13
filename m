Return-Path: <linux-arm-msm+bounces-97460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHrwDjgCtGnCfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:25:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F595282EAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B77C30CEAA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD87D3921D7;
	Fri, 13 Mar 2026 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAtEBCD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2c4rQFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CAC35AC37
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404569; cv=none; b=QudFo7dmyFdQ3xZ9hACP/Eqe3LKj/5ZiMpOhqLJqu06rHaYhdakOlL4j28mbFBxoneZNm6XSPm+WJDtyYlEDNlEt0pRm+jzCr920ooRIGzkqUibbDznNw41/yYpul0xVAyNoC3g4ZMCm+hWtdRiQzMV7UIAdZ3C8vu3BY7ZG1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404569; c=relaxed/simple;
	bh=IiLcCmOPvD3FoVkoRDXLMc1j/Ghty07iKgvAHB7xElg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LJB41rXM6gUvJSs0sXe59XmEK5PBpdnMwAgjDcJe3LqbJk+pTVhdMiRKItYVmUB/aT7HxidmgGZGrm8Mk13jIDE95Kw7cbL4gLWGrdNsS3AgvpSM0FS3bmu+2sa+RVMaHNG+E0gYZHFgqnx4gHl5juqZEXkAGE/Y6pmjVDLFKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAtEBCD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2c4rQFg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsF2C525821
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DvbP8Pa1ntgz41T4salejD
	91ZOa7k4Yxu5DSIy2ubz4=; b=HAtEBCD56WkY1V0fOWNpZ9deFF1qTi/pPtG3wL
	kQMr19gDERySiFSJd66GnbB/b6QI7D4QmwU1LF2wKfr/rpXvKyA7zNHeabcWqOd6
	S9/Y2vrQ1WbodUr3U6tu19fuKDvJAsqJrMA36RS23qRfbmOnv+M+XpUJNabmiqJ5
	OZxUbfP8TYGFgyC4qnbGWsrjTOEEjenTX1mGKMkWKB7v4p3Z0gqhFina9j2qUUj6
	W5SNbhF7b4f4EmYWwn/6txvO/LMAcjmX8jFtugZhF0jfJH7/7bl6zULlAOK7+KDD
	5hGJU/uC2Lh07DUkr2RmQ160gSc81iZVL6F6UeDJAtxuzgNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84r7xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:22:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1146667685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773404567; x=1774009367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DvbP8Pa1ntgz41T4salejD91ZOa7k4Yxu5DSIy2ubz4=;
        b=V2c4rQFglNxIVgNUmJJ7HZhYBWh/LtBDduG3AjDJ/6fYC2Ld2B8nnA3VDichYapBFh
         mQ5sEwwiqdp/vvNktgVclkimGRvuEItE2RtHq9QXwY3guKTw13eZrkmyDJMfMt82ktxl
         ukTGWhhy5mGyQway6BWFtgQ7Qk1cbDWePfSIrALt3Sx1iHIqtoUhk2/+JmD3QJIGNcYg
         QHvoMn4iA7X61URcucuJJZ0YUH+kvmPafqNsn3SchQw2erIktUWFXTlJhPdePoYZM/tN
         tyQT0MxArsP6oFvWZMn8W1SQVJOkX5gJlujmwJoyWBmGRFw9ed0Jlodwwj+0JynSoI+V
         gR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773404567; x=1774009367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvbP8Pa1ntgz41T4salejD91ZOa7k4Yxu5DSIy2ubz4=;
        b=tOurlMe8lwXYvwtZXIgfTAxtdhbOvf3Ms/fT7w9HmO6PDORzuRxqOvLYjG0kygtJq/
         YBshVLov5gz/ys0pqKimeeZRtB6aAighUmvykT8QtFwLl+O2+0j+Pj26SXwaSzaXK6uO
         YsrY5MAeT/AzH1SFuHmsFW0iW2QV7Ef1IZHQ+q0oRPYbGMgOR1/KZgfAyK4WmWhx2aEE
         fb8+Q4zrAj5DPVbc/bXVYUCfwQ7u6DdoGc+9h0v3/+2mcrGVyqxiWbaGIT8XM0tVO3+T
         whyDGs/8VQ3nU56RlQ6Vh95BWUYpfYF1bwI22t0v0WllwCbiAoh7nYXTbyUu7x7hjBzO
         nAVQ==
X-Gm-Message-State: AOJu0YxN1ne6cW8pRpKdzy+AAAJM+gmExYTGcZwyd7uDvkfSbV+5PYxK
	RX8LInYxhvmTuajeDs3sQQqDIVJ/IRw9Ok62vBsekqxodED4v8C2vNb4X8JOA9L4UlDE0BVrKf8
	n5dIjDpGhiY+49leKwG9USksVajS2JoSV2YNO5/fI0iRpxa7KS2GiyulNyiJALFLd5m9u
X-Gm-Gg: ATEYQzyXIICMle/iRrXgx7mnjMBcySd2CrYALZxHbWoNVXMl7vcuHIaqsaesRxFh9iU
	nRP1H+xdqn43MOqcjKeh0pUqJF4+krkOeRjLO1/Z8H9opet15WwStecaCjfEFqJQVLSX+yuEKOQ
	fW6yEylhHyoaHQ6rDXka4h2j3AtVINZGi7R1O640xGibwYKRReo7h2aiWVcNQIqYJ1+H4c6MF0E
	S2h+XEOLrKyV0UkGzn+xErYKybcQf7sdRGjlWgUud0x+D5fO9InOllg2BBEwcoEe+OMJlr1ICcF
	KVVQC5dmlgToTDKLjQn+u+TTJHtNsIt2UvNxWKhhaqu480/3viNlGdCAnUnaPwniAZSRpq7KXxn
	NYpQqxjfN/GtqzFPV5ayIb34DfPM=
X-Received: by 2002:a05:620a:6c86:b0:8ca:123e:819b with SMTP id af79cd13be357-8cdb5a06043mr384661885a.13.1773404566814;
        Fri, 13 Mar 2026 05:22:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6c86:b0:8ca:123e:819b with SMTP id af79cd13be357-8cdb5a06043mr384657585a.13.1773404566285;
        Fri, 13 Mar 2026 05:22:46 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778eda8sm33286775e9.5.2026.03.13.05.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:22:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:22:38 +0200
Subject: [PATCH v3] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb:
 Document Eliza compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-eliza-bindings-spmi-v3-1-b8ff1e0a6171@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI0BtGkC/42NywrCMBBFf6VkbUqSah+u/A9xkSZjO9KXnTaop
 f9uUrciMjBw4d5zFkYwIhA7RgsbwSFh3/mQ7CJmat1VwNH6zJRQqUik5NDgS/MSO4tdRZyGFnl
 u90UpdSqtSJhfDiNc8bFRz5dPprm8gZkCKjRqpKkfn5vWydD7bXCS+9NKABgpswJOPVF8n3Vj+
 raN/WNB5NQfKBVQKssTk2aHwhZfUOu6vgEkgr2rGgEAAA==
X-Change-ID: 20260311-eliza-bindings-spmi-8d49b1a61d03
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IiLcCmOPvD3FoVkoRDXLMc1j/Ghty07iKgvAHB7xElg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBptAGQmn96j3ke0Hz5RRAS5bn3GHsSGLS/ROPPH
 1ZQDAzquPCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabQBkAAKCRAbX0TJAJUV
 VkrMD/wNl+LmG8LEjvizuSxu0SSdXoJvYg4sz5Lce8hvDPNiHPe6i9VVcYG0fTrwGozMnwtF4ty
 S8gBeWRbsymwTrZ5MH4GEgH4XYD9mX8a8MGqh6pQ2RYkidIwW4sAnAHAiaDo4zqgYnKYVCMP40j
 G6MjmRp99rH4gNS5ysfeT4yu9L5hjNn4gpnphstFSEygc0oZhnSuTAVRKuNkMhJ1w/p3HJSi0WU
 FTNLuKrvZEgJutcmKTBjsbnTNj35CYTeBBbgnXe0qyyrFl9h1DdtPfae9T7wUP7iy9jwj9mSw9d
 ACPQL4K/MpH2fBYXWlbwFpUZkypImraczqnQhe4HIQtIsIE/qJ8Ij5pITK9jYmkMJmLAtRz+ap3
 ZxGNIB/f2UvzgnomIyJ6RNZww91trCm7kRPvx5hkuuNn7irHb3KY8XfFxORyTF6U0NQ2iEQGZsq
 +lUlk5U2TMUZRp500+CsG7OzjO/5XWidDNQbubLJQDsb5OhjdHTFWKd6JKZ4Ki9tE2ICGcTWKFA
 /n2IiIZDY1VmBHSr/g8mewjv4z6YlgCsg3OCnpqXSORXzPueBl1+Zhr3z/qArMO7CIb6HtcCzmj
 /1mp8LsIXPKi41y+qZFgeVOg3/avda/gdXC/dnl+bzXAeOYaj4VNzrr16uYD+11mgY+w3NmglEX
 Itd9kgDnnrkJmFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b40197 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fNS8NsvCbKrWdB45dbUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OCBTYWx0ZWRfX4p0nGrrbAVdE
 bfQZJY8C7fE6dRzGsgjEH0itTHCjFdrEcu9Hs9hAYgpj3TQmDB274Jt1kg8aAZleuxdqXkszgKb
 bMvzhDDzTIeJYPdeSz11zcBIfZC4WLZvm4MtOTLfM8/H7ItUoRZ93XNAFTg7Pw60U7lplH/wVDA
 hhbzx5H/Qrbz6MReHeMZW86qR5/VBDDd30fK2GKXbQXP0BV1khJTMFQqd1XUP9jcsaly5pbB4ot
 HWLNbMJ/Po6OLwL5qhyZJHeyn+v5bKbBq7BSPscett6Coe6+Ch+Jgff3ZGzZB33hWNvwbkmEoxD
 pIlOSWqVubbaBs6ynXxNYUqq1u5CcI6s/R1GVAPHyePm3QWdkmN4x85Q52/REEw9SWBlSsGdHgc
 OK7vtnOyIQTUAjanq+J/kKm/MorIU4JtLQbi2/T7DV1ObcG5ZUTYszHjpSE9lDQxQpzBuWZTYpu
 oGxbx5ak5khkdORpYYg==
X-Proofpoint-ORIG-GUID: JisFRQDG_ueH4fxfwYTGr5gLGXd7DsPK
X-Proofpoint-GUID: JisFRQDG_ueH4fxfwYTGr5gLGXd7DsPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97460-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F595282EAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SPMI multi-master Arbiter found on Eliza is version 7.2.0, yet
driver-wise, still compatible with the one featured on Hamoa (X1E80100),
which is 7.0.1.

So document the Eliza compatible and allow Hamoa one as fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Add back enum for eliza and sar2130p, just like in v1, but keep the
  const for x1e80100 as is.
- Link to v2: https://patch.msgid.link/20260311-eliza-bindings-spmi-v2-1-12783c6759d9@oss.qualcomm.com

Changes in v2:
- Instead of reworking the whole oneOf for compatibles,
  add Eliza similar to sar2130p.
- Link to v1: https://patch.msgid.link/20260311-eliza-bindings-spmi-v1-1-1a20eec1179e@oss.qualcomm.com
---
 .../devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
index 08369fdd2161..0f7089e0950a 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
@@ -24,7 +24,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sar2130p-spmi-pmic-arb
+          - enum:
+              - qcom,eliza-spmi-pmic-arb
+              - qcom,sar2130p-spmi-pmic-arb
           - const: qcom,x1e80100-spmi-pmic-arb
       - const: qcom,x1e80100-spmi-pmic-arb
 

---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-eliza-bindings-spmi-8d49b1a61d03

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>



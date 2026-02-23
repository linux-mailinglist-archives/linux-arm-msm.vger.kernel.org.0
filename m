Return-Path: <linux-arm-msm+bounces-93674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC2hGDBDnGk7CgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:08:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C020175E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 443E43012BF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02821364EBE;
	Mon, 23 Feb 2026 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7A463ci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbgOwtGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4D35CB8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848492; cv=none; b=emwPCKKNu8zoTPzYGBML/pc4Hs1UqWarh9DE5abO3uOTh2G5G6os/XqC8EUKttLltLIDeXiLsSo4A9kPz1liDnFBp58PghaawWqBvEzyw+5IECD3+y9sfOLFOJNzWASsvifTL9AhRnmdKlA8tFzdDCFm1DAs+qCif7HbZW2jnb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848492; c=relaxed/simple;
	bh=l1P/X8RaAMg/5pk8zCokOgngfwYIKQ6wvGBAfwDa3YI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PxRjy7+B9JeYJg7UcOkjK2Lz9RuVsWlbEIqf8znp0q9bk1ozdfDKcrXng6bXiPCo6tRczya9JEn+Uu6q4INoIphuUn2qc2IcaKSd/VUn7a/CXUjeJSZx17isv/N8lgLg3wTyBtghUDgIGIE7Tl7TZvF4/6x6mV5Xtfuy+g2VjdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7A463ci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbgOwtGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAG1cN3603537
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nD29bnRta5GqbY29x+LShH
	634ju7lcefNjKqeboAYaQ=; b=e7A463cianJf0Qg0xYaMLlhZiogSyAAYpNHH31
	iqeVnE3mg5TaAe7CP+Vsd/olRzsDokV9DZVfxh5RX/t7Y5yb9ul37L7akBUI6dRg
	p5R7fH6wGjGrvaq7MZhNN8tjVnHP3jn6meZFIrVZZgz5/go513vGq1dU+dJiqjlQ
	xoR5d7jHGVf7Qh7yEGZncVYxw8joCmdw4GII1xvyW08NNvW+GNXsykWaNyfWI2Q+
	t56KXlWnid4cgap0Ko7tshPNoXKzlNGxvOLsyvXJEeMIXKWhBqibb4dSDs6zKX39
	fm1KQrs3BThw8xxtxn9UZs8w4NSDbplO9/gNOGnV9xEZ6qoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8mkkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1602482585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848490; x=1772453290; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nD29bnRta5GqbY29x+LShH634ju7lcefNjKqeboAYaQ=;
        b=hbgOwtGGUduQXk0/nRSAkr7BG9daQQfbi8MF1IAyJMfloP/JLigm7eiQWCt0oZ7FG4
         eO1SeDagB37t5mMc0EyCfXsbicIYpJSZ1Es0IqtW0YuGbcyO8uKIyzf/MJfI/IboW4OJ
         4iemxAAPZNgBnBohhhnQHzoKQm/Zhu9QrHMkWSJnQ2SKMKDUYHI7bPgTZijIQqMugNiH
         yJR1KOCfH754MMOFiKS0blYRB8edX2d0v6X/7P/1QcI8xin0zgExD8PDTS1p6csLZY5a
         RiEU+LCLOPSZ8aZnQS7GK5AaSZrUa4lNvswgsZX/VJqBdTLP7sZGVRVkdYH6plXGxKF5
         Htlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848490; x=1772453290;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD29bnRta5GqbY29x+LShH634ju7lcefNjKqeboAYaQ=;
        b=xI4CmIBGJhGAs+WfJpIhSyPMVTKjIuZWTbX08GiST5Lz0SCyldOKapb4hRmFvwwEDf
         fb3HAkWoYSCrS6AM99gmt+lomtjJMKDBR6hj2KlyPd1ugYe2LoJ+TcTHLwAuFAbhH71B
         1CkOpkCx4RYW5NgVt2YsPz3VespaPYZtclaHK8hY3NZxFUs/h2le6js6bP1xhw236bNf
         r8O6j5KvRW61sACHCHRU7kGuSm2aUtpGwfW25H9p1XSnMaU0bLjUmDusmnzK41edWbqi
         zDYt+6KeuadrSH/nkZODxBGu4Mz4hU2Nm+tlt4aisYwwfoHeSJeC9vN22YnnRG4X9yOO
         gfCg==
X-Gm-Message-State: AOJu0YyQV5qZXJu8Cp6Y/124jG8WIdbjkXCrBA8KwQIn/Mg7HwdD5lti
	/UtojxuYTs6/l+zutqYAB2EYQnGnihGKpFQhnBbL2bR37tbr5B60T67mlda+7uXwjFMNdzgkjh6
	8ONaU0jnVqsGJev12Mk+0SF5uSdm0vTltM/nW1UH+gfqZqNHoNgX07+8LQliLYdC+/Mxm
X-Gm-Gg: AZuq6aI7be7BZ1OU9/9UOL0chzzg6sM8Xjv2DOHgvdqgLaw4935iVwKaf4X28waKvSu
	ehYm9BcxPk8IIHNZON5hfysafPMFFULzMMhy0rP9jwoZiVwcQq0wcfQm28eoAQ9hg3o7Po8ePSo
	oxtFZswbSbmx85kpUUF4Wm2W7IgJPNdPn8UguDPVYeJs89X+j6EU9X4HWvomTDJqFvCcnX4eXxI
	l4GVciRA+gBr+frLtydFqquibO0uo0uc6BLNO6yjU7Mglppb3ZLJ3LAQNvpDMD8UtWtOUxje6Gf
	pHm2ad0cE8aYP1VsOvX6i8QOXiNc6hVu/pHodGB3pWbrLUaVLwiy1wQT/CBpbDYdvcW7PUagZHI
	u5JGRCfPyB28rTA6k8mwwEyB8rb5Drw==
X-Received: by 2002:a05:620a:29d1:b0:8b1:ed55:e4f0 with SMTP id af79cd13be357-8cb8ca6412emr914218785a.39.1771848490116;
        Mon, 23 Feb 2026 04:08:10 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8b1:ed55:e4f0 with SMTP id af79cd13be357-8cb8ca6412emr914214385a.39.1771848489519;
        Mon, 23 Feb 2026 04:08:09 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm16522603f8f.24.2026.02.23.04.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:08:08 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pmdomain: qcom: Add support for Eliza SoC
Date: Mon, 23 Feb 2026 14:07:54 +0200
Message-Id: <20260223-eliza-pmdomain-v2-0-23fb87eb70ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABpDnGkC/3WNQQ6CMBBFr0K6tqRtEKMr72FYlM4oYyiFDhCVc
 HcLrt1M8vL/f7MIxkjI4pItIuJMTKFLYA6ZcI3tHigJEgujTKmMLiW29LGy9xC8pU4CaHXWuoY
 CC5FGfcQ7vXbhrfoxT/UT3bhZtkZDPIb43j/Oeuv9lc9aKumOOqW2OEEJ18CcD5NtXfA+T0dU6
 7p+AcyvYpjFAAAA
X-Change-ID: 20260216-eliza-pmdomain-dd10911bd4e4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=l1P/X8RaAMg/5pk8zCokOgngfwYIKQ6wvGBAfwDa3YI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEMibhgyF+jsisUUDVqrKSQMzyOr4d2cQZ/IR
 r6BwQklZqqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxDIgAKCRAbX0TJAJUV
 VqQbEADDZS8yACVnC9c+SXfEZ63HCw4YU7pZaLxhJlTcToFAj9sagGdmj4tJzU48DFMo5LlRUoN
 TRMGf4VQWvJWpQtPZaL04Wr4AauZzBlZSiH8OA3S5mi2YGCrBqCMYlCS8nEbUXOkcKOu1JYN9MG
 LdnZFcMFilaadzMwfl+gucGLMwE7eHOVElkSB0TpYo8V7WZMRZJ/Fu3cR4ptS5w6xx+Z9EzGhnJ
 1Ijb7pGVbmkWHrO+IxbJe7pvBGd+777deyYZmsn5kyBjb+y98oCotMWaUKjIqIu+x55pagqV1Oq
 z0Mzxcmkf1TbcXhuAJF5ScUcfb/suBwBi47meVdUcOfftfWAS11hBsVQNjx2PIpK/V6pyyss8pN
 YfzA7Zdk6+cM2Prq8r/GzQniKAEA1TpXMk73pbW+xonpjVogcd4+5EXAzebdgkRtd0H1iTPAGGP
 psxOzO1Ite0mkB2rbZdVNyssjNq6QFthAkEVq6VNEdQCxL7pzpVoCha7cc/AFSiJbp4cYOSABoR
 Zv5zAxxVfeNRcj0PA6cC/+NgRzLN1NIEB2qQaXp3uK4XtMGc+g6mVZ+fhp/Cj3ty6YHma9QdY6K
 i25Msi5ElbTVI7ArjF6LtoFkAhyApobXWswUqWWqxUAocxS1Wt5o6KcXJv+kojFGOma2AvjoPrE
 yDqXCGiRDXiicCw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 27qyxbPeyITWKDZc2Z8bWUV8R7_TiA7-
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c432a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=c55ydOb7OSgMCAo-AKsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 27qyxbPeyITWKDZc2Z8bWUV8R7_TiA7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX7rjelmbkLw5N
 T6+B/04UwEOCOMnCx/AkmVz7p6KF9a68n9vEpt0S1h8utj7pW3EuimL45xSfbWjKczhx7+uc139
 93ooZxlEAkuJwn2sShIj5hNrdQHct1GUjGj+CS1uII4foubxiHYYhp4c6oGz7Q+YyNPSYs0wvuv
 h5NSqvUZaIZudYfQD9fr8Z56VEMqeBOs5PcIhguGnqD/SauWZmQuaH+LJA1EsIzekDNzLhR2+cG
 nuXGP/X8Qg5CBkEYito0OCNZpwszq3h2K7fdnV/pidFISUDXM7wl7C+fkohcgiCNIoyKwv+dYXb
 N+J3goX0iuA7pWAJXfe0zsCQ87vW/JGNxIrY3cx4pZBFiGtfy0KLpsacmR2DeAq6HQtQfjLdN2/
 opBcn0hN81bzMVhvak2RLJF4hXV+YmwK1BpeniJxNf5poIxufhjqpKJCo88hJMT5fPXMt0fgfnc
 8TsfRcwZ8vbKAIU8hPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93674-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C020175E4A
X-Rspamd-Action: no action

Document the SoC specific compatible in the devicetree bindings
and add the driver support for this SoC.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Changed the MMCX and MMCX_AO to the PDs with CX parent.
- Picked up Krzysztof's R-b tag for the bindings.
- Picked up Konrad's and Taniya's R-b tags for the driver patch.
- Link to v1: https://patch.msgid.link/20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: power: qcom,rpmpd: document the Eliza RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                     | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260216-eliza-pmdomain-dd10911bd4e4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>



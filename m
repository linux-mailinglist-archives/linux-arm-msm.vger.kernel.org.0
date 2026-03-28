Return-Path: <linux-arm-msm+bounces-100535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLFoFsu+x2lxbgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:43:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4A34E3AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A56FB30571B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 11:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B0D388378;
	Sat, 28 Mar 2026 11:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGoUnxZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XV6qbf9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9606638839E
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774698105; cv=none; b=Thy6X1Y29/Egk2DXPYTxwYJAT0RihLnZgNOBWYUftbMwxAZ1lKXQRi0JnQXn2NFnqnhBqz06Gey5xD9Zf4UPRQv/H8hRDlD/JolhRJ/DnCXluVqq6TmXGHitdLD0Tgd+KioHhSJuvirvCgSMlutRfenrWKVc0kv7SBLP2CFvAJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774698105; c=relaxed/simple;
	bh=0ymMkQUBPqgf1VrLwJhR84QMoBJgVAFwu0pWiha4Oa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6P9QYBBjsnz3+U0Mdv1X97M3BCOAmDwOnS4+M9LA1xu5uP93EBW8ZdU+ekdev/u+Ih8jri+VIlkDiQZoDZ5N2kqOhIYiCd3aziNP/ULLaYRizL7C+EBf+jnrgoQSAvlLJ6AKRW8AES1tktYVvGgRQ0cuJ0OVMCpxV6tUOBJ6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGoUnxZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XV6qbf9M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S3Z9IF350127
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 11:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhxOp/n71iqstxBPaCr0alC0/h9v/UTbNFUu3VzHFVo=; b=NGoUnxZ/7uCpA0Kq
	SlkP+Afh7IIViijSe6IjE7ldZzLSzmf68m+8AqB/ekyKavQIKib/YPpEzw4v9H2K
	Q9R0Jj3xU9HsYaMwJsKpwyvj2afNFU4b0opnlRONPRFFLy/Bh0UM3PQq2aBOykda
	yGkERMrqWiQbHgcm+VoD1E34OC9ceuZ5WnSBbrY2jmkmN8qR5N4EQNppO9Xehx4+
	EhHEbUukRd+5LVajXaK8SmIm/SrJvHhXY/wbhcLkvxc4x6byEmRqiZPgdZuArMqi
	QXXZHmA5pg8lyc45J01o58sPuKaqes7k6vJJiKhWJapBjX+SPcQRw/06FLdPTE+W
	xLeSng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67710pv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 11:41:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b90fb083dso830559a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774698103; x=1775302903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhxOp/n71iqstxBPaCr0alC0/h9v/UTbNFUu3VzHFVo=;
        b=XV6qbf9M4+dmbwFCDL9F+abEyxfiBfExHwON0UiU9mcxzNfUsTT3PdM0VYswraQbmy
         geMWZvJT8O5PMUQKE3SwpZepzlhpRDhazamQE+4JgiiSmxQS2gwytlMW1iaPbvaiZ5e1
         kDo+jjlSRBLqiySZguJmaBaZfZtZ8NDEnDzkz8WWTVfdW6++BXakGxpDNZN3C0ivKKsi
         qnKfG2S5lENpVILg7Gy+XBgpDu+xJdsuLfnVZ4+WNvaB4me4amOLC6D2GAzj5X7UXP2+
         05mcaLZdl6tx6IpwkZnsHnQMHxsTrnYTKaMtKQLDPdg0X0vK1YGHE2qbILTpIp5fxbwu
         2Zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774698103; x=1775302903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MhxOp/n71iqstxBPaCr0alC0/h9v/UTbNFUu3VzHFVo=;
        b=q4yeSrxsMEm3x2rfBtyRQ8Sn1NhPHStFOYFufXM83sqHavq4iqf/mSQuIESt2nlqkB
         3RNhEsidMp8OBarb8EU4jbgcFZFkUDCj95MHwgiaTwCsXpEJUBE3cXW+KAHNNLt0oPVT
         KE6SJGl5y/E0TvhXh/vzKWzRlGqtbKqMdF/llaF87EbXL4IHelgaKnPscilm1qRC0nqd
         U8stihR8S5CovbTlst84NM58He1WRtRkzcgbC/REnGqsjQvsKNz4dvlnEWdhnyWXGrLa
         jE02Ja2lGuGehJRQMDX651OPWrhJlOj/codrAjJ76E2tT9gCzUCrZR9jLV/NDrw1qsWb
         sNmA==
X-Gm-Message-State: AOJu0YzMR4PNU0hjzGuctx1AWlfqsuqiOI1muXg1rh/1a8RYwfx/dyQv
	Rj08GUtwsJ94rAzJLjVN+zJkpFO2WhCNOBlHkmObcOtZYoZIqSAr1jIbIcFZ1vy0DzyJqZ365TY
	UkYhPHMhzMWuGkz2y92dt80u6ycM8b9uu9hyNOn9VOfJfWBqPGsCDVggHsfZfvTiVq223
X-Gm-Gg: ATEYQzxt1joKZ8wq6uDMa3ZCjo2B9j3V4eS422vzbzSA6jwpHNNQGfTD31KSefE0+oP
	3TNK1KhHxDc3/qJS/m+3F8rGVkGGY3ZfOC1Rs5F+Zvrz6aI3/bJAQozTLsomfb/vUXvMJ7BZ6Ej
	BJv2b85P97OE4X8Zh+cpo1Dq9tlmXVQxCGeaFKrZiolHvzxk580cWyG8QdriRWZNLU2Y6Yer4B1
	WfT+610yU7b++kCSd77Yb6Kp0zYxQ24uadNvlzi9Jim7JGU4jMJs77wdIgm1mD92R4E9q5QE+qY
	Hw5ma8aP4Qkxl64UGURjMuwKtc9eVIpnyYUgMXisaC9xoWGtBisNmKmJHLn2hWVTLySUWcAKKIw
	lzzx6gUoe0AxzyDwJgMWSujoSZ0jUy720t8kRunSMMp+DRSwRWBFR
X-Received: by 2002:a17:90a:ec87:b0:354:9dcb:1943 with SMTP id 98e67ed59e1d1-35c30143181mr3615075a91.8.1774698103132;
        Sat, 28 Mar 2026 04:41:43 -0700 (PDT)
X-Received: by 2002:a17:90a:ec87:b0:354:9dcb:1943 with SMTP id 98e67ed59e1d1-35c30143181mr3615064a91.8.1774698102725;
        Sat, 28 Mar 2026 04:41:42 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917db535sm1681238a12.30.2026.03.28.04.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 04:41:42 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 17:11:17 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
In-Reply-To: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774698095; l=772;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=0ymMkQUBPqgf1VrLwJhR84QMoBJgVAFwu0pWiha4Oa0=;
 b=Aby0fSSn5pn5k4XyffGMfBZZ1fP8hqllgghxjlndC3Eqc6n8+Y2rmmyV24Q/XynEzm+Ixrxhe
 TxEq61w1GR+CAatlISnuoY7eFv6BMil2oreJ9T8k7v0iRtjW9S5Adwe
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-GUID: 36Iz9L04kaldJq0Lh--BGw3uj1_mNdRc
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c7be77 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=D8ohcI8uam9gCU2zACoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 36Iz9L04kaldJq0Lh--BGw3uj1_mNdRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4NCBTYWx0ZWRfX/g32d35saOpe
 bum/F0VSRgxKPHj8LQfNdcJYcRC26i8ekDjh9SEvuP3a9HXon7sc/jw2Y2GJCVBC0hpfKOBCaIL
 PSz/LL1m4/GyeLnItzqwngJk7fEEiAUn1YYS9f4kcb338NoX1BZJhK6dChfnd+UGA0e1R32X7OH
 MQ+zbKlinScRJLPpyi85p31VvcO7Xnh7AYLuIGFBnZeOsef+nu+p1GU6QlzWGA6FOu4bfY+IFBI
 2IfHthATClLVlZbQiwe7vJOBahLAhhuy2F+Bc/aIdkHNjvSGGf0AHPPm2j6dZLTm8rRXbsQP8sy
 FY2A/eV11n2IuFHKERVLDxT4JN0CUBrvNcUUBoDolkKRLCHC765BR3gzRa/tneMLm86p0M9pfp/
 PZSas0rFhVvv9W5PUWtMF0ZwJzz8EvkbYxkB54EAhMptouz0kwmGl97++wFY7QZynFC9ET/ULpX
 yeX90uwlCBSU0BkjQJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603280084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-100535-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFF4A34E3AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce new bindings for the monaco-evk-ac-sku,
an IoT board based on the QCS8300-AC variant SoC.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca880c105f3b..07053cc2ac1c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -918,6 +918,7 @@ properties:
           - enum:
               - arduino,monza
               - qcom,monaco-evk
+              - qcom,monaco-evk-ac-sku
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
 

-- 
2.34.1



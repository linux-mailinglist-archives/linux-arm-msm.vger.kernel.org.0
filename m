Return-Path: <linux-arm-msm+bounces-104742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OilLkhu72mHBQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:10:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A826147411F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D54C13000885
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B0B3B9DA6;
	Mon, 27 Apr 2026 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDofzOO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDmQas/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C5923A9BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298446; cv=none; b=sio0cyVqB38qhdOD7VYIOCXsfUFjfrWBTByjNIqOog7kPn44ecSYMDiCZHCt3MViF78YQ4ibNLwoshPZjwDLa4U2mkaG8qOItLss/l3QDyFPGg3kaR6l+IX6GQ103LCGhq/AvNvYHEmiCWKfsllV9YuDERWiSrxL3KPsUgNUEVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298446; c=relaxed/simple;
	bh=bP6HA6pZjm7hEbY5JnHa5ksDdA+WtVqVV3UGDdamgPQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FVV8vvx2LT33b+9HJb8CjK46kmcj0+ijST45mYFztB6fhBaYppqAhr6+VLt1m3ukDWNwvsWLJXDPNX/ZNu8XB5ywOKcn+YR5UpSkTl+ajemhjSeYMXnVwQ2T8HK0x5ULXrmqEeZP0ns6L2rbl/9zyH26P9y5c1OcYWX6Y/T7F8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDofzOO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDmQas/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDknqJ3639605
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e+qIoID6Yg+3aC2B7pB4TK
	5iyob/h1HJrqolQGz2E9U=; b=gDofzOO4I8TAtexZFG8UXhv9/zU/JniCYKUtYn
	vzGfjO8i2ThDssKjDIPSCX5J6b4Si6UrGgefdw4u/iliYq7x9S0d5tNnIh1hcIkM
	XAjU5Pe8+FnUSyzOn0DmzPaM7bg6FdPt9NqW1eJ/aXng2owDtCLkyN+icVZ5N/Vm
	FZcUeyuewHSbouCdrxZEz8BG76/riFZvRdg0W0DgSCV2tenjfwDY6D4QeLdxxDOr
	bey5Dg4+fzRPAJKtjYzMTQYlWpbKiAbptL+33CD5Y+bS0yhNmuuqdbyTYRHNY//d
	ylXVmeWGTxjyetxRp2mmbmzaGcAcjzN7+9avrvYuzyZDUqoA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya02bmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:00:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953cccadb32so11860353241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298443; x=1777903243; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+qIoID6Yg+3aC2B7pB4TK5iyob/h1HJrqolQGz2E9U=;
        b=gDmQas/OUpUgsGq3aot6jj+nrrXm1lEfuhhCJW9OjeK8cT21ou02FLU879/al5QSWh
         xKt5Layc6TRsoenIJKaB/fv/WWx1K/Q58RPGG5LP23OzS1Ho2egeDVPTc1T0jbK0D8fe
         34JDnoZhr56fqsu0fAy3eWnhIn4OsB8Q4e2nRSu9ODlc9ld7xnqNIW4EkL3VZJduYJM8
         JKaFjT9l2zBlbHUdvsbD8aM+RMP/bhS97CH71q0G+6uvI5z//HHjNXoj+5GZVyI7DXLF
         OjWtiTNR87isDA4FIkQGPnmL3kP8Xs+hrWq8xJHB9euwvLYCfAWadCutAjwys0WRTj3Z
         Id9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298443; x=1777903243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+qIoID6Yg+3aC2B7pB4TK5iyob/h1HJrqolQGz2E9U=;
        b=saJtF5ALKjtPyGTpgOTWxQKvj9sNLowr5/0zfEAzKzQBE5jhhF3+214uXVEwO9R+Dh
         ujAYwt7hPAV/uls1lH9PjUzZddvXjKBwYI/XBv3EACsR2rFIBhA0D3l8YputGCgOF2oW
         sN5Q9AClsC7YRJkO4SHyv1ww/cUwVjXVnHCnGcbpRHQeLaNPCWcKP9Fp6N3UyjYt2T/i
         972FgFtqEI1/4JTAZYxQL76QHmFA/hYp9xNrSMP6+eMSiCG2JcS1E7UM0VJtdMl4J/iI
         CLHD6E5slvb+UigxzCtEoBsOCZoeTRUz4/xNaD1bNTZBd99jIYehIDHbB0kzh7v1Y3Z7
         JQAw==
X-Gm-Message-State: AOJu0YxsJn54dJJq29oPmN7GqQK3f1eZdKSH9xwaksPneoQ49mXOdUh4
	c3gAKtEZI+WJYO4RQ29MbZ/XcY+1eOPZ7OJgds5VHKwtXp7sJnO3NZ1lzDFyZ1YCEn0a6dFiCDI
	c0NqVPOmtVpVDEnFhMJAS8zvz/VHbec5JmxGsaqRTeQDXqLvwUEm3dyAOdovliRaQb295
X-Gm-Gg: AeBDieuxzeeyg1yq+6xeyP2nCjwATOKv5iMeWRf3zdt/k6eoQ5pFmEDK2xI5qzB1LTl
	wAbkXA52JaG4TuCpgpnhCkdPROmDxlJuOW6wItHUWzDh5wIARpIE/SqWbzzea4MgQ6TgtSIGjAW
	/EeZf19TTqn0IKiqS2AYVSe3KWkUGwsM4tCry/BMCti8C2qjxQUsknNUdn3YanSm5c2HNvcjB9K
	8XqeByk4gkFcqpxAHXzkV0HRg4WsLrND7GmgqEOYQDixZSnAHs1+j7CXU0TDSgNkH686fyF7mN7
	TNTb7cD+OgBTvCwZ9QrO7YKfG3SFgisezu9/ruxr+jEMlLEUCvKF65yKwO+f+XclZNfrzVuINWx
	IZDYL81+41Jl256GjVaQaB/dDsvjgmPqCjeSLj8j/oYcPJmw+tPUvf+QTTVD1yA==
X-Received: by 2002:a05:6102:b10:b0:611:82b:a590 with SMTP id ada2fe7eead31-616f73f6ee1mr21753686137.25.1777298443498;
        Mon, 27 Apr 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:611:82b:a590 with SMTP id ada2fe7eead31-616f73f6ee1mr21753575137.25.1777298442558;
        Mon, 27 Apr 2026 07:00:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85d0:5328:3f13:c3e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm626849135e9.1.2026.04.27.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:00:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: add support for the TLMM controller
 on Nord platforms
Date: Mon, 27 Apr 2026 16:00:28 +0200
Message-Id: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxr72kC/22MwQ7CIBAFf6XZszRbRIqe/A/TQ6XUblKgQiWah
 n8Xe/byknmZzAbRBDIRLtUGwSSK5F0BfqhAT717GEZDYeDIJQo8MufDwNbZWnY/qVadJWqjJRR
 /CWak9966dYUniqsPnz2dmt/7r5IahkwoKUaBqFvEq4+xfr76WXtr6zLQ5Zy/bOd6sqkAAAA=
X-Change-ID: 20260403-nord-tlmm-b5878960cec6
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bP6HA6pZjm7hEbY5JnHa5ksDdA+WtVqVV3UGDdamgPQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp72wBv1/nO6x/9nLQf3pM5oeNQ1lnuKL1EZSMA
 RJ1XvrHqFeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae9sAQAKCRAFnS7L/zaE
 w1M3EACON20QyLwDiCoNEIMTZZVSwoXpmGSDFS4F949jGpccdICoTjVZLof23FFgmfG5U7OGZq9
 aZxhIcKe4eck97XE7sc+urLbgjbXLapWv1Wm0E2D18hpHJcRcfFW1/7BQdRyfwcpfbUJ2egRgjA
 jt4VxooIw6MGU9yIBwPWx09kfC63R1jvE4VkEBw3D+Y9sWcHHxbBSws7SDz+gM5+xMnms4dHJRl
 dZRDntz795lNy/0G4RRYpUEFMn90dAHhq1A6mqRAfZkE+P39PNUnZoKQ+06RrunmedmynTfXBcg
 +zTUekOyJ4jAQ7bVqjOys/2YJzyihVo978XZ2g52JQloO60pNLw4C0pmeUnF6DEsvFqOGfwvmzc
 Gv6B4r9Bn8k6KOwEPH1D+fJDQhn86b98nWdcJ6D/kO2Oe4ITDIKePPtNlFeFqAbcpTE1Z3foVmO
 l8lfCemf7Hh4hQGW3aZ/NW7HGhXy57QJMvYclpnNSYJX/aZ+6iUwprC7eCP7NP7W5TcPSgD6gXA
 6Ekir5wf5gbkl4AoQWxuyNOWFwPMLWaUobbl5MPe7h67CN5CaY+X0gMzCHF3KNUELE91/KiF9sP
 eT4sos/jzfrQvjyAVX9g5ILPuh4mNIx9bVekKOOeYMRftpgi2M/YoO6uv2SlUC9ZtUnJvP2XA9x
 BN9CTFbIhVRgaDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: N0wgi9-FnH0ySH4DgXpkpsplLZzPIkRW
X-Proofpoint-ORIG-GUID: N0wgi9-FnH0ySH4DgXpkpsplLZzPIkRW
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef6c0c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=qGPvtIwEQInV9_J8vEUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX8I8OoG4DWuFz
 Y+X6OQtPwwDiX26lVwXSE7QnOebIuBOwZ1H2J6L7+i5g/7901Giy9/eihH1SecTS1R3DQHMmDY2
 D3qw70CNykmm6cXNrW5wgI80WaBE8RJHpqac26gi1URVsoLJsQPDf7hV/y1EqpkSOlwYW4smq6i
 zonoX+9rMGKR/CPe/PoxKtGV8BqOv8hvgpgG6SJWjKPjbxKs94rxtDrc4BotyxTXPOf2psEzEm1
 JNruzor0bNT6fAl5nlmee1vBEo3K3r4LnR4e4Yha8YiVRNQ5Ez9Zk4vX7y8dnPVCI50KxCntVma
 MgPMWJikILO4mwQ1NPcbvpeprjtT7sDvfEuaNZZxDDe+edizNX5X0mOZ8RATwoBRQA1daIughm8
 DmnK7Kz4vZtmyF9aJ19sAqBSxRhUANLkNBArQpuPnLMNGzw5SrjsKnHPCRtyhRS36izVHcQkXjW
 /MJXSfqxyW7oZAQKkhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270149
X-Rspamd-Queue-Id: A826147411F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104742-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This adds DT bindings describing the TLMM controller on Qualcomm Nord
platforms and implements the pinctrl driver.

More info on the platform here:
    https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Order Kconfig entries alphabetically
- Fix the regex for the pin state pattern
- Fix maxItems for gpio-line-names
- Drop unneeded line break from bindings
- Rework the pin function naming to make resulting state entries in
  devicetree more concise (drop the line number suffix)
- drop .intr_target_reg from PINGROUP()
- fix values for interrupt entries in PINGROUP()
- drop unused SDC_QDSD_PINGROUP() and QUP_I3C()
- drop the arm64 defconfig updates from series
- rebased on top of v7.1-rc1
- Link to v1: https://patch.msgid.link/20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      dt-bindings: pinctrl: describe the Qualcomm nord-tlmm
      pinctrl: qcom: add the TLMM driver for the Nord platforms

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  184 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    7 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 2843 ++++++++++++++++++++
 4 files changed, 3035 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260403-nord-tlmm-b5878960cec6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>



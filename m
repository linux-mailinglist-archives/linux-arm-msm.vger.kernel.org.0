Return-Path: <linux-arm-msm+bounces-102352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDvdAqqN1mnzGAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 19:17:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9613BF635
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 19:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D520030398AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 17:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE993537C5;
	Wed,  8 Apr 2026 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHURPQup";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7HzCL37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415363D6CCD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668515; cv=none; b=jA3JV4KcLoBcTJzwPDUjeEpfu1hrXHhRgwth4nF6fXnygbEDMfpyEGUQjlxB2dRHPJF75iLrY75/O2AJWhgblv+tsev59C/CWspcTMp09M8lGjBIiIlOv1vl7k8EhVhx3D3gD+AqvUg/hHOXBB8Ka1EHi8cJyzK/Gx2MBncUeVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668515; c=relaxed/simple;
	bh=D4FRhcOACF7pc94x5qgQDchbK6AYknnWBfZq2d/BUHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n5LU6fb6hEw4/jKum5ioB9pPW20XryNkfgLccCyA3hKgR08JbxdwfcWSSWoad9BwLyhG6LMeRh7IM1tJVoK6YMyOsJDcdv02bhycjcSgGAZ6o5Gh6mSLGN8ziAQdE8YLcbCZhphYQscf9XPm4ySMIlWkHpxL49ATAdthtmPNM1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHURPQup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7HzCL37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638FooFV2411813
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 17:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=; b=ZHURPQupUvXIcRP8
	pICTvVdooRN8cXy32/VDBb8wPKJ9N2p2SxSy0kxPDXWrulWeEuEn6ho3piHldMSG
	LaUQUc34ZPsOr0Lx8HxpAaPYT7SCG71jgs116W0fUg2JCoemZipzbWXUYRwb9rBq
	IAUo+RVALSX4M8AiXoixfkI75CyxySydSJAFSpe1ZyTVNjitRsUeywLDF6ottSdT
	LTMc2PuyqMciusC5x8lZrOYjJxUwnmIN58PSTfNeZL0vriiGY9Q8vMSwxli4FXts
	9Qlmy0oR0ErjheQZfh6mvtXzUkOAUJuQKU9J5mniouumL61UV79jtSiqHYlAswD/
	bUR79w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vcttg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 17:15:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7423ba5342so258115a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775668512; x=1776273312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=;
        b=G7HzCL37pzesdz3/q3K/WWdCFeBudWORNzC7jAV9H/q8oWrkU8lvSY43m7EdloM/gk
         f+e3XZWl7qUzYX9nRTcKvk0mqDgny3GPga1Rb8DckXqYmt2n9s0TjoiVIIV9pyOx7wpv
         kWXghBlD88TJFeTHSLy0KPnDvaJpHWZVfOz7+lj0+T6K8A2cXasfMjC7cSIuPYMGFLpk
         sZsGzi1twxgar2P/3JbeYYIU7Mp68sQ0rQWdHlJ5M8C+anbKZWCbg61xTf6Vfau4U500
         Bn4s/IIJqNyUxrmqd7kpT2CEMX+HmYRdESvcU2Q7Pwr+v4xAfIXxDmDFnsLXfUaqoVgv
         jXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668512; x=1776273312;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=;
        b=HKer7fRbGoDlxiQ+v99gfk3AhbvJUZr1Z4KHs4vmNu7wt1/Lr8GttzGU/BGkdLKk4S
         X/wyUd7Pg9kMF2qQNBbb3Mh8Ck9NJyL6XiHtigxdETTXVIXA8kQw+SOHhKq0wCIwKOhg
         wqx8/SZxlWeMQXQUiBKQdNaLmGhl+t5W5Gvl3lBc4Wuj3WccwEPZLqQwQ42gHkjYNWTg
         rqKa21wxHdMaZyp3+Mm7bJaxSkAzcSKh7fel9y7LFgM0CkowODaZcclX2SsztO4wxJqn
         Q2KX34Cay6GpRMormxao7NlbEqSMpvPDIggtOFwOJrqhxINf7f3d+5H6A7s+avWb7CsJ
         L7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCW1jv7kr9MRK6/rOPJRx0aIhy6guVDelbdy5VzWI1CUxTj68Wv9Qc7XEErpNrNrU8N/Fk3lR/DXD5FFa09y@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNbnCOOOUlHdsaDv+5gyqZUhUMCxmqBq1OszHWNUbGDVatkB6
	W6RVDSQ5psgl6bGwnz8xKKbbmf+E8qrmCfcT8Vgj1h+pSR1E5ciHXgSGgpzwziV3TL8H4QB1pv4
	2Kkk13HWm5CadgwTXY0l6bOdQ+PD58BwPq0SBNWiEaXm9H9zjXRp/WjiEyTywOkiNDxr8
X-Gm-Gg: AeBDietSD1rnkOPpYmDb7ZnNA2VoG94ZVLkcvU66ckLn37KqnEK8Dh6snMj7PEMPKmX
	AIhxmk6xr+kP5He42nHUkhPwmYVbrO98iLRu1FfoU89tFC3moetvXEXJqLDcROcjOrC8HsI2TeK
	evedg6PdQdJnkvC/aH7VQRvkYrgeQGHhAuwfgmd/Ng7JfmFz14y8RcEydIsYFFAoC59VefBRCt/
	cvewZZMde+rrKV7pF0cjTl+mOTULmJ3EX043hv69GcyM99ZiGZVyP1KhSszEyxVllbPijNPyaim
	02js3EwblSR6ZBCm6HG92t3EwTaQKK7bhlvgv3Wq2yPPg6RxayIvypSoWOnEMG0gNDFllGwpeht
	WGZcVkLrhhIXyQTxfpUGUdYw/koVMFuhnEpgMQu0UuILL+F0+nBRhMlREnRErPVwm3u4zK9cvi4
	bh
X-Received: by 2002:a05:7022:6881:b0:12a:b39a:339f with SMTP id a92af1059eb24-12bfb7451abmr10809572c88.21.1775668512016;
        Wed, 08 Apr 2026 10:15:12 -0700 (PDT)
X-Received: by 2002:a05:7022:6881:b0:12a:b39a:339f with SMTP id a92af1059eb24-12bfb7451abmr10809540c88.21.1775668511298;
        Wed, 08 Apr 2026 10:15:11 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm26103624c88.0.2026.04.08.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
In-Reply-To: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
References: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
Subject: Re: (subset) [PATCH v5 0/3] ath10k: Introduce a devicetree quirk
 to skip host cap QMI requests
Message-Id: <177566851037.1322920.3559253544691274000.b4-ty@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 10:15:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MCBTYWx0ZWRfXx7lLUUYlnJ6H
 kmO4jH2AF6QbRCjJSYBldIu6ZWkBIdtDKdtRc2gsRHyIDCZmy+NAI3wvuJa70Z1oFVFLiIYDVfG
 328Q7iulaMhgJk3J07IncvzsuL/MwaB9WwpuOHW3Kp/QfCJ8uLbXf6ZlVpxps0NYHM7v+Ecc539
 byIX7hLjs7IzipQntZD3irnwWKlbuYKAgusdNOHbFnnd+fNHjXghqrf65g3KDfF51KCgWlni/W/
 7EjbUTIv+oyDzIMIetdoSPJk6JfAdT5qkMYp1JHjt6QNEagCivkuKyP6TCi1uriuPMVxw8d31yq
 w4+ZJsmn6DuMcRu7JnwH++3lE5mux/eMmo91Jm+M8FSzJO/q+jLU+9LN51MJGBQsvx/xbdDYBsf
 9BDsodUZI+ZoTQnlgV6/9cai879IPVLW5hCxa9KxiptE+ga3N8LimEb077SR8owbCeRY8s7XaQG
 qjiMIPGNefb3qVY3Egw==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d68d21 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XIgAiO59-CApRadi8WAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: YXD5l5nGLNJVuG_MZDunuY6iutbEieUz
X-Proofpoint-GUID: YXD5l5nGLNJVuG_MZDunuY6iutbEieUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102352-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F9613BF635
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 07 Apr 2026 08:43:53 +0200, David Heidelberg wrote:
> This quirk is used so far used on:
>  - LG G7 ThinQ
>  - Xiaomi Poco F1
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
[2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
      commit: 6a7693873b20680a3c33bae0c9f9cb3185f64ade

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Return-Path: <linux-arm-msm+bounces-112632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mwsZKWhoKmqBowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:48:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7566F8AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:48:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="n8QjI/w+";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F6hyGMJD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112632-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112632-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09EBC300B9A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FA036DA08;
	Thu, 11 Jun 2026 07:48:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427C436D9E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:48:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164108; cv=none; b=ngzQr6OmIKy5acaCfvqcxOnyPL7Z3TOgYcXO3NVV+0uu6LohQM7WtGYqhTRLXhFSWHNWSAwZ82xw+Lq0PAVlqhCGwfLuORG8cLFixm9yIsiGCCtoITNkioYb3Zg4u2K04TlD6ZKup+Vb4vEhC9IzdnIulmDuTF+Z4+Jsqs+N22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164108; c=relaxed/simple;
	bh=EqFfdWMLZ75/MZ7WYh37/a/iG4ZiQankO21U0rtRGIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YU7FEyOy7eHkO/Qek6sWGiF3lzIj8FsPH/3EtR//0vL/CtJHfslGBZaecb0H890VrIOZVggg/12fnCCUyUpX6iRAZvG1YQkh/Ofk/cr2bqFJCTuoI0Cq8RHmqLi/A5MvouoXndKJEeAk0HQXPw0/aivA5Dq78O8Yi3OUyrcVF7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8QjI/w+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6hyGMJD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GYKA3812635
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PM0fS+lk/KoC0nDbUIgggUlzlD3UNjmpQw/M3rIgjVQ=; b=n8QjI/w+miGM/9Xm
	4Zf1ubcZ7N6pCnUCtF9Y88UuFa5RL7ErUCYo9CODievoVUcjWAsi0FqTLbjTG6sK
	mam2zq4iIncRziHd8T6sMozY63M/gagINLNrVFqCVzX8rX2NajiaiSqWTSm96I2B
	HvFENB/e/e5Blii6uuVmcjogtS1ReR0UGYxlCzepedLg90Nx5nfMgoDVLqb7uU2C
	UTL44HR/zV1j5tIO3/7XIYm2haFyu0arsZtNuJwJ/fmWGVqJlKvRwXOOzwtXoQv3
	QjKHiODpJK9bfF1PhgQno+//+lHexLb3Tjc6qQsJHcDMWX0ICuswX8q58GOCxZDS
	n0BEDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71jcek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:48:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ccc2d4d2so109839485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781164104; x=1781768904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PM0fS+lk/KoC0nDbUIgggUlzlD3UNjmpQw/M3rIgjVQ=;
        b=F6hyGMJDU93B/ep69VMBostzZGaAH6ue4J0ZTda0lWEdrckuLKwoaITK8v3JiQKdFg
         sXdY7TB1hQJl0WGI7U2e7zwPfmlJmsmFCg5CEOjZMnYuHoaHIu64pdhqxqGto6ujei3m
         /nsCON/gs6v5puOehACiTaMJLRoxap7QhzoRtnsp1a5W7NzqrVmsDn64JpJfottIc30V
         F0tf+vy2YDqvdmJeB5WlpxKS9fHg+2ZFcTo70lj6wRLHbpKSvzOjFLmB1VjfG+36X5o0
         7SoJIJ2soSmSN8pn02JuSuYZcygF6hwTUyYHUlECBFG1gkfW846Uhdru/bE+mviysQkv
         ecBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164104; x=1781768904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PM0fS+lk/KoC0nDbUIgggUlzlD3UNjmpQw/M3rIgjVQ=;
        b=Rz2WwHqkk0luI/W3wNgUYx6O4chX4bIKwb8+TVs95H2Zq9t0Zx4yFwPfGwF/glfCcn
         KlsKYFv/VbPQIaYTe5Z/jCHA+GJEuU0gJcSMtNCFbNYO+7kr0Lhn9ntBcgSSivI2O1mf
         libBTmjY1Z6xerJeZG/rxxMBtnd60wIu8HrKuO1LtgICALe10mkei3Exdts9A/CFN49B
         bGwIWD2ch339I/B/yeUyGLvQIiMLVkPIXgfCRTu12tSO1rGCOyjm0QqQtNZZIMt6hCAk
         mVj40kk7BpKG7AlebBNcomT9RT8c33Y2qlYbfs2Ppmhpi4k0FHzPmthuOwjv5DtFFUUV
         PPoA==
X-Gm-Message-State: AOJu0YzOmnCkGsZCQhY8cLl2dNyvXYpTrh9dYhur+11jXEWetbqyTOhx
	tshXIcVsIyYeNmH66S/wN/2lSZmJPssVjgJw8DHVEJbRyWPguvjGCxdJWnkDb9r2u8W61diodPp
	6diqRRAsiX/UVaee7ikIO8pZ2XMVpY/WUkv+i26njc2plxyLL/aROlMMD7Ee3db762ru9
X-Gm-Gg: Acq92OHojGSq7hsrdc4VxoxHCvHmos7Qmz1rHuq5ntAXi//7son6WvJnUNG5WNxnk+U
	HKT8VP5goATgGuHdmvMGmmPYx3387C1lf+eg9kxcnomTR1a2u0tbd1H9DaNliLApHIeno1GlPWj
	qL5YHf+ikSPUbS/eE0ZInmB9fLWSevNzmDEBXeEkL9mPirjd/QyExFEBM5ao7U09PkrqHtWkoKR
	AoJDxOGV9yt3nyU8WdsV1CaprCDh8rFhMZPITZLnzssOE9L416QY6T4MyjY489U9Oid1Jy2yG2N
	3UpXUdYvbzNbVVvWMEBa81QfS/cW9qzPwFOcYvEe1gG/iIeiNiHxoIxMuU6mQGrux17oNr7poXb
	mjAQkiSIKjGxWhpwo+WHi2y5hBsz7UObsVRXeFmf3KTjmNskK8Sh5JT0g
X-Received: by 2002:a05:620a:19a6:b0:915:7c1a:1388 with SMTP id af79cd13be357-9160ad1d321mr125853485a.5.1781164104445;
        Thu, 11 Jun 2026 00:48:24 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:915:7c1a:1388 with SMTP id af79cd13be357-9160ad1d321mr125851885a.5.1781164103978;
        Thu, 11 Jun 2026 00:48:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14edbsm23291666b.3.2026.06.11.00.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:48:22 -0700 (PDT)
Message-ID: <2a095c3b-735c-4955-a2e7-a8ff5204c457@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 09:48:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/37] arm64: dts: qcom: sa8295p: Move PCIe GPIOs to
 root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
 <20260611-wake-v2-23-2744251b1181@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-23-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sGzCvL4ouho_XRFtVCo4ux0Fzg_RPZmc
X-Proofpoint-GUID: sGzCvL4ouho_XRFtVCo4ux0Fzg_RPZmc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX908Z/wQRJQAo
 rqvj/3p6Pfbhw/qVYiNQa9zdKu0ij2LomsaZCtBncN4Ew28R+8HNzbNz7wd/U3IriKi3zOpI05q
 xudvGFJA6naMKuZ3u68RSWIcWcRrLbsIEQ7bx7CZNZO/bVpaItAEEtm7482P7WQzGws7VZMvAIL
 TQn1gMNEkM1d342XZI4tKYCbsmfPSI9xoBa/cd+MB5wUbFAzJZYS/Yeho4RCnDLDGowQVAhd9E2
 VL7RA5UKbeYqqfzCZyyQxzZncoFkJ8nOooDZomNnD4AuuS+zFu82vVFAeyB1Sl9n22BNVnR/Fk8
 txiGfLKi7q+W19EO3i6h+SkiqdhN1JCybfQMO+RTLximi/4neZ+FtJOvlda20uhP5pIkvbivtf8
 iOeU1shzL7kzQkn7R4x0djVPeF/VvStZ5jOj90eoMkMr6cqK2n8h/dfTCuAg3gcDC/kJ+bknjJr
 nWCpproRLvvmXQfVJ8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX5FTha+g1u6sx
 FA7RGmL+nKzP/szYXoHX/lHiiOcueImvkvSEDOtYcUZEsr2rJwSPy+xWRdyyZgOE0oWttUSzUcl
 SRJ3ZOrrzQHjAuwlICeWlZvYYgia2Mk=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a6849 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qQnc-EaX_wiEaOCXXosA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112632-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19A7566F8AB

On 6/11/26 6:58 AM, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie2a, &pcie3a, &pcie3b, and &pcie4 controller
> overrides to the respective &pcie2a_port0, &pcie3a_port0,
> &pcie3b_port0, and &pcie4_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
> ---

The other 8280 SKUs should also be converted (and the phys reference
moved to the port node) - sa8540, sa8295 and sc8280 - they can be
done in a single commit

On a sidenote, extending the scope of your series looks "odd" (mildly
related changes) and may delay it getting merged (perhaps not now since
we're at rc7 so no more merging for some 3-4 weeks..) as the new pieces
may spark lots of review comments

Konrad


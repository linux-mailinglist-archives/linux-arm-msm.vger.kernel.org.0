Return-Path: <linux-arm-msm+bounces-98197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CX7JBVkuWmZDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:24:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF7F2ABD34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA09C3028076
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F1A3E4C76;
	Tue, 17 Mar 2026 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYMdeYU5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="di6gVpNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5FA3E3D9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757432; cv=none; b=XPi+pb/Oht1B8FyNhlXzik3wefAbYE5geb29lA4OKxxsBw/O0ONGQpFCVFXCnN1GeBPyBOusjUA55MhNZu/aD15PtSFPAWXrMwr24c7GzYKP/+wuNJ8dqbPwbG9TY/YpVARllEdlp1HCdBoSWQmr5KKoTPHLWsd5qZMlK2Lfk6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757432; c=relaxed/simple;
	bh=mf6L64Ft8h7rdW12NvCSJ/UOsksKCSptgmDHvOpJa8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApmXRr4IXtnWUIaXZHec4FS/4p0+VkL1tX7AYW6VnVDcY2EqNV6riEB74foCgdik3UdGzWb4GIEXrz8b4Nk24EablO2HZ2jaIPjcqGXHPW8QdEPR/aoX2vnee6c0JiSona59YLmdD6Nh189CO1lHjBFqwQ/vvc+eO/jm8PaiA6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYMdeYU5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=di6gVpNL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HAjwtE254242
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m5a6b8OCqGYyDXv1eiS+k4Yn
	1kLejoBD8Y39HnssxuI=; b=pYMdeYU5LZPYVaGKtx8FFfEf6ljafuOkCHx7OwU+
	xfR6aoj5SYZyO++lUFnu+9BKQz3RdIHqhqR1l3ih0f3BfJQYCBqO6yEgE/+ghOt8
	lJmsUzyRR2rBEFG5ZcjCsbsQm+oLjkx8EBSU3n4+VYDQBv75lqEc2l0ks0zrUYx8
	iCZSkJjbzYfHgJex2H4hCMqKp/3Xt+yds5nlhk+g0pZQOKs1/FnI3hTGSttcCtGV
	U+QFsKB6Ix2EOOWfqx4BBL042bPFr4irpvCs12ZPfwmxvDtSZ+mjtEofsGXNTaUt
	UjkxmvdMPP3tvajHqwCutlERwSpBkpUzW5Ir0C9brqJxXA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8gr69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:23:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829a54693edso3429502b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773757429; x=1774362229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m5a6b8OCqGYyDXv1eiS+k4Yn1kLejoBD8Y39HnssxuI=;
        b=di6gVpNLAYzHBLAMANUQcPsHrD23p34rmo5z941TX8JdCVnbBv2EmaRMKUdQkMI6Ec
         INfKijO7Kgx5kcJTkSLOD/H9+Qe2ApPX/tNDcGKg4PXr3SsR19K3rm0QPvah0FMoQKoD
         ivoIsnudrICV3r+gnVeO3Gne/ROWFcGkUpH4+YdKKYEPKr1/f6kMwzgvlGwJVhT3ZxxX
         u+M+RWTdjZrPGZh5hruoAwqtS5yb9angbnSLRyvZPsWYYRP6zaIdLvQBGhLhUyDr+zyb
         Wq+wLhDZ6/QPBAJKdh/hGNpgeYg1NuDKNxEVREw3GvSU8XucTamEV7CAcfk3RRKP7FQn
         GQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757429; x=1774362229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5a6b8OCqGYyDXv1eiS+k4Yn1kLejoBD8Y39HnssxuI=;
        b=TJiNF5stUW0yfHy+M96aalrsdpEZWjl0M8H6sxjwPwqUfqn26L+V66cggVccqr6bZR
         DcpgdOoBWRYR+SZ0KqUlrj6Qf64ucjuD03Zn8/kUc1fLzwQeDzjwNtFmvB6smAXj9Kap
         HG5XS9t0wyHOTTac9atP+5mCZrtB40eOpWDBZQCwWqGVl3oLF3pfTC2UZoHWVJx+ggW4
         0v+ZMsNjSDpeYMJI3f0Z3YUf8Q05KiPLqyEFjxEgR4C5LXVmcQm/6gJng7ZJx0QbhN2E
         GcTplmLRnh8OxFbpgXJJkuRBkChiq/y0CotTZPOX1Jq6yeOM5Z2PcBgZX5fS4mt6DjZR
         BzvA==
X-Forwarded-Encrypted: i=1; AJvYcCUoZsSrxWMqIiQiswVFb8XEapPnCfuQ5cofAJ/Rft7sIWMOCjlAy+wSl6lyH7k0r/5iB8cIkRSg0pnH7b6X@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5eHP7LUvKmC8EqW+HHiVP2zkBJWW3ckJ1bSzT6T1G9sx2nNB
	7AeqZZshXxTIGOhqJnZCh3Q787DgX1aGYO794V/+z9EuJzgbPNKmMEGu8p4yr5lvIagjWYBbdLN
	5rhXxIZJjgk5+JJOXvJ1ay4gfak2VpYXflGlWWSd/3icJrl/PiNM+kjsj1pPtyWalaD7h5AS0Lh
	hj
X-Gm-Gg: ATEYQzwYxJ4ZrBwjA07+GB2WN8xgzUUNk88UogE8mYvNO/GOnvTMXCwuV++AWCdIGcJ
	X4V0UieQHuvAwyfidr5gawB+hVbS6HGvLsP7R/1UwyVJiVAy2Lc1Uemn3I/znoIaJhuZO4HnvNr
	Wgrwh6AOlhSGEi43MeIwSdHfH/vitUNnGEcK9FAn643+5qAd7NPsAR9vobk8cImjhbnvldm74Os
	9ZHmrq30wHoVaNwEdURjyKl2c+H5ewGbF0fU1wGitP79g528jtGUE6GBo0+xRELmUK5p6TxwjHU
	xODJfNCqj2CYlVaKb6sVs6JiUVUw55/dSajljAakDXALxe17+63v6LIpZII95xU71FY5K6KClsC
	FH2hTJwTx9w6nF5VcQESrCivU55ttrfIC8OoiseQ14HQCtPJSS9f0nqy5Qu5zxLNkGz5AP7OLe+
	s8GvoRunDDVm0aMwFbZtBuN+gqAtSwLSjIxi7PBEkH6w==
X-Received: by 2002:aa7:88d3:0:b0:81e:fd4c:fb39 with SMTP id d2e1a72fcca58-82a19895725mr10550739b3a.4.1773757428693;
        Tue, 17 Mar 2026 07:23:48 -0700 (PDT)
X-Received: by 2002:aa7:88d3:0:b0:81e:fd4c:fb39 with SMTP id d2e1a72fcca58-82a19895725mr10550710b3a.4.1773757428046;
        Tue, 17 Mar 2026 07:23:48 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07365090sm16482504b3a.46.2026.03.17.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:23:47 -0700 (PDT)
Date: Tue, 17 Mar 2026 19:53:41 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Message-ID: <ablj7R79VjE5Kb2s@hu-vishsain-blr.qualcomm.com>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
 <20260317-lt8713sx_dt_for_next-v1-2-8195fa931ff1@oss.qualcomm.com>
 <56829589-1c56-4c96-a9de-505058467867@kernel.org>
 <ablZcxUIJDrrs9Vb@hu-vishsain-blr.qualcomm.com>
 <ba22ae2a-06d4-41c3-920a-f1fd589a2111@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba22ae2a-06d4-41c3-920a-f1fd589a2111@kernel.org>
X-Proofpoint-GUID: pqQkwmWrtUAq0dtsfO5V3OYdv9zDNmLE
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b963f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IKUxUcNsYIN9M7-V2k0A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: pqQkwmWrtUAq0dtsfO5V3OYdv9zDNmLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNyBTYWx0ZWRfX/Ypuz9N8Gpw1
 wNnvrYUjMgBo1/fJKTuPkfuYOYrpZLwm6zTrk0d0TZtHOSp9ohI1og4gaCMAiUbF2LDR+YZccvO
 INmxRZuByQgUihHbvnl3K+oV9XZ9XjKdusP7hqXIKXraaUzKiADFlCriZdHxeMqLbevShMBxasA
 JdiaYMuKvzUZ2c8+5cRnQWDEtNjNhU3MkoM7/O0wSz43Qe8obrV+mY5jnTYOIBTQR5dXglwtDrj
 p1qpV4IOM1g5sFJbmA/VHzAGD5FapqfBvhgSFTwZH3DrGrqReCPPkdIWZbERxPtUEjNaOM82o22
 FJf+v4WbFyglFUWro30i0ASojbOZn2YKh0Gv7dWHsJAhaKXUWVdQtwbqTLWW1PBspMZGCq2QrQ6
 W+cv2ObxL1fQx/7sYJWHyT/noWtfsDmvjz740L9EYRqFaAej/9XlcRHSpYAEK4vL1ZH7ZA6B97M
 sVqHd6MnC3P3EZD4kmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170127
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-vishsain-blr.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98197-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAF7F2ABD34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 02:49:56PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2026 14:38, Vishnu Saini wrote:
> > On Tue, Mar 17, 2026 at 12:44:05PM +0100, Krzysztof Kozlowski wrote:
> >> On 17/03/2026 07:03, Vishnu Saini wrote:
> >>> Lontium LT8713sx DP bridge hub can be found on a Qualcomm
> >>> Monaco EVK board for converting 1 DP to 3 DP outputs.
> >>>
> >>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/configs/defconfig | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >>> index 1d967a81b82a..c8f89c87672b 100644
> >>> --- a/arch/arm64/configs/defconfig
> >>> +++ b/arch/arm64/configs/defconfig
> >>> @@ -1002,6 +1002,7 @@ CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> >>>  CONFIG_DRM_DISPLAY_CONNECTOR=m
> >>>  CONFIG_DRM_FSL_LDB=m
> >>>  CONFIG_DRM_ITE_IT6263=m
> >>> +CONFIG_DRM_LONTIUM_LT8713SX=m
> >>
> >> Wrongly placed, at least at next I am checking now. Look at Kconfig or
> >> just run savedefconfig.
> > 
> > Cross checked this few rescent changes were added configs in same file.
> > verified added config is present in generated .config file and lt8713sx driver is compiled with it.
> > Let me know if need to add this config is another file or at different place.
> 
> So did you run `make savedefconfig`? If you do not understand review
> then at least follow what I asked for...
Yes, 'make savedefconfig' executed as below, sorry i did not mention about this earlier.
make savedefconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf

 
> Best regards,
> Krzysztof


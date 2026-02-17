Return-Path: <linux-arm-msm+bounces-93089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPvTFVkzlGlAAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:22:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89F14A527
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF535301F15E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAEC304968;
	Tue, 17 Feb 2026 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ld2fHMIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ix+tR5gC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694663043A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320147; cv=none; b=eNspOz2E3KXEZfT52p5LQd8YCfupuWG+4bAHE6dz8NGJj1cbya5rP6lSZLdvhmqCSa2t2ayu+P5pG6hrs2TugMFAYiN/AzyIK8BJivevQHmPFX6e38s8wDPXDJ8umy9P49rtJT80w7sb+Nv6ma0qC3jf0rA5qZH3lhLRy9uqk2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320147; c=relaxed/simple;
	bh=hbiMvwzdBeegm+xcz4ZKpJyLySBoW5ne2NZevRg2h8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgNvRqVOg67tGCfCMOKKaikEUgiG2W4iRC+PyuAkDMNi79mIQI9mZgTR0J/4eanCvTOOsB8R/RIOM+8UVtER2YYb1YAPqokHMzPF7tTDdJBzn5ioGx0VSxBJpDEvcRcdhw40SrPqqFwbyg1VxUor+tBLvFYUObJyPaA7zYIBcxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ld2fHMIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ix+tR5gC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNYmIG2296956
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=; b=Ld2fHMIfIGq0pjpb
	rSDEW8T/sQN4MXLKYJ0f2ezrDjgclALUQq4EtfTiaHpe3LmD+7KC5GYy8MhqtwWD
	wYF1IakNTMy4xk+qIH8ofUMVnjrPa+eGyYLEZljyd9bipRR81yF3AMGKa94kR8Mk
	9ab6rlqB/nnT69CUveW8R/yjOKUvlAJF8ntH8s9Q3z3HfS/Pf4lKm4rU2AGEYQxC
	BqYpXT5+JxygbKlZtEeKYHABl2YeJhsJRz5WBSplrXfHNPLGS0hdWlwxQBz/5XvR
	nOjx1QUH+u9ioCgrltCZSwOLkq6tvXKtdTlwX+XcUAu78HkBsY+KXblNvcE2Yj7T
	JiaJKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajsn2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89545f12461so28612726d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320145; x=1771924945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=;
        b=ix+tR5gCpF1zEBtSROHIvp68Unw/QYlarstRNVlJ6564bxfrvkXROg0sGlGSDXJ6PV
         +xrUKf7CDsPmadyx9b4XJ61cLY53UDOs67j0CnpESyELMfJCCtWveH/W2uUfcgVFPKFw
         n6Tx5lw7aIX2vP2GIZE6b1lbF6M5xWIvV0Kt1iyyyLJWdWHjRYeF8L0Nk1veOnDkC2G5
         w0p22jPbevfiUaw/ozo29o/UOvNbaDZuldPuTmYmeS6QilcuB9SI0ONbB+AdVZoL1Mqa
         4LVRcu3H00VvgpsQu6AxeidqjbbCjxYnk1RVVqeAehoXBFTQ8rWXcldvwj8Br7y/Jx28
         b0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320145; x=1771924945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=;
        b=cEEq6GrzRqa9jor1Jz5T/tDl4P3W0dHO6zffNj9XWnzzzl7jt8l+M2juRub0rCQOw1
         wqHG9jL9tgRRfczbNSLOI2GEYSbNy7FO2WZfSBNOZEBRm6EiLoGY2jhVTuSchrvuriMM
         Nx6LxvP9zusNgTg0qoZTHtgFe3Xq/YtvIQg4SKnvbaga1AMA1hrGWSsWGarF7BOedWEf
         Z40iTsXyhkire1dIP1S1+pNieI79EPfbszulkf7cHKMIm/bFA/QayMkfMmwYfrT3hu2C
         sZLIbL+9SXYTJUFY881W8nUBkCHAmwrrfOBkQ1ZtkSsIphaZXqMg7fRCMvAcg+JrAN03
         ty9w==
X-Gm-Message-State: AOJu0Yy7mB84++nFBQyH977+rk97pzTORJGC9d9XXC2oLuyZGi7+8iGe
	GHUJ78HsRQbhMwUQcRYq5yF/3pWyBWzbwHLVpBv5ltUV7HigRKBrDxIFjbEkSVqnlUWHabBVZa/
	6wCEOpoKoTHMX6d+LluifcPmf80jZ4wU86iLCXYS2Q+VCJwx57PFhbXtJAirLHHWh+R8m
X-Gm-Gg: AZuq6aKT4sXd498j1PLtsgJLZpU1wNyYiF9Ov4LQ+sdNIguT1HnCzkWFM2JHr6Y5Ku/
	ASVUD2jaY9x0oymE7gBJsJSHhbooXD9cNlugSZG8OOL9jFaBnchk+Lvl1ySZyM4IWsPVwqqqFxX
	LiCNF3+kV35n9ve89au2P6HchcgCuM1NsJRztfPAYAISxrr5UN2+oygszgyxhBVvgWzM0Ooqlcp
	B5poYe1vQTnZLaTcZWB1icG3HJED+agIQThQiK2bwCV86Lr7qCGfbG0suR2D8rLJNCTRumD+bP7
	Y9J1jc/71IUzEkdo5RyY0dsxbdeOqGI8cEvC6AHmd3thxEJwERobwG+QpiR/9voT43/XIkcdcWH
	NBodtoya50PvtmpR4mUc8iPfZgfA6SiuIx9MyXwYkWoeZP/28fN6NdIX13CrNg18xwuUxUuhCPE
	6dFLY=
X-Received: by 2002:a05:6214:6014:b0:894:9d67:7329 with SMTP id 6a1803df08f44-897346fe806mr130852676d6.2.1771320144849;
        Tue, 17 Feb 2026 01:22:24 -0800 (PST)
X-Received: by 2002:a05:6214:6014:b0:894:9d67:7329 with SMTP id 6a1803df08f44-897346fe806mr130852466d6.2.1771320144379;
        Tue, 17 Feb 2026 01:22:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627895sm347299966b.31.2026.02.17.01.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:22:23 -0800 (PST)
Message-ID: <e817531c-2061-4e82-8cb3-af7997784a25@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:22:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfX9nPV7ljttANM
 D4c6IQJ8hb5PMj5igSonzDQTREn7sdGkR4HBiObPaY+c9AYddo3oOTlRnNzEjD/cIJI9qUWSutE
 8+KLnjTrvMhrXnJQrjW4Bi1g1xF8wnqZBld6orTS13oB13c00cbGC7Dtl4QYq8uZLReFV7n689J
 XPNCWdSDQrpRlkWuH+dU1SljrXRtRU0oVLJxmbVlF/HEyFR5AT1J+sBtqX0qiizH/0UsWUTf45y
 8URPIVvzbf0FhdfUNuZ1xbF6MLIQW296FNwS9g9iyTYydLRgWJGAv6qXfsv8tYMFlMax5vaJqIw
 CjMR8UCiVN/4Km99HxV59AFyV11aHR4eKKI9V8mzHUd6g/bZ57tKZQRqPQ7XpSoaxmZTr2U+nYu
 I5wmszA/oOL49d44/dKWGfOmmEu8zyCm4/IYQIsSl6uosG9hIvBctRn1eZhCIYLcR1+1E5kPQpT
 HRPfFXVBTk6xg7PVasA==
X-Proofpoint-ORIG-GUID: K5i9KP64L4GFdZkzqWaSU5klWkYapkMj
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69943351 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=NzzAIdn2IQfWdxSLNSIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: K5i9KP64L4GFdZkzqWaSU5klWkYapkMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93089-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE89F14A527
X-Rspamd-Action: no action

On 2/17/26 12:25 AM, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


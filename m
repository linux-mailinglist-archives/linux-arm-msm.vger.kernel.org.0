Return-Path: <linux-arm-msm+bounces-92464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EqFIxcBi2nJPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:57:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371F11940B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1DF3308299D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D407478;
	Tue, 10 Feb 2026 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6gZkou8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtLEXdpU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F620C463
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717225; cv=none; b=Z99SH8rbox7I/NI7AJ4FPhPRPynXLZ5hwWCbDba6WEOa2k9HeOLm7HKNIeQrSyN62utfLvvkIli4qkWyCkzQU6YIutuLg7P3lpFBc10Ybg9F9pWIsn7WT7C9gMme+dEfJ8ikRflmAJgYNoFojhVwZaHCRov2Or5gc0KJ9OZ54pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717225; c=relaxed/simple;
	bh=KumJxGa6qTFlTl9rpdtKJde+I9qSpWW/+hpWP6CkDwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9olnI1IgCQLQn1S+bD0WUVfBVxMSnZ9JK9cwBzvqf4TUn/C7yPXBSJuZJoyiCBm4emnQ8mkP+r3fiPNb5ZlxZOzdY4QY473T6f/G/UaGkct+4le+78SX7jsVC2Zd9iOe7KLvijysUMJedCRXpUujQUJShAGjl1OyMQ10TkEs2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6gZkou8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtLEXdpU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A54C3A802038
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fE0JtBuPqrjoJF+XmMNOZcHSaCL54PVRJabZmp1KT7s=; b=G6gZkou8a4h7/6k4
	8R9EOb2vaLQFYJvx3gsL9/VCXIkd34KDnMvzgosXo/sQhvk+9UBG7fKNSvbPQqh4
	SpVNHYSLu935IrrzRIGthStwPWS8bSDkDXw4DbYNYdsKlZe+xNwrfT1ggCVrGaMn
	gM1KJGWRXr/myLyBKmYZwArbjhxtW29EhPoauX+9ZomQeJJcJcGuhaEH+3z+JpKH
	RKuiCsYFZwneRXox81X9i8Ceg2UomLDTgk2jUCQELeXNRRrq2VRAV9JySUBOIMMx
	1b3pQY7jC7t3dLhZaKNrp42j4hCkCz+mT18F/pg4qA8BtuOrrAUD1T0oRGYkyKCK
	oTTaug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u0xr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:53:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8960257db65so10007346d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717222; x=1771322022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fE0JtBuPqrjoJF+XmMNOZcHSaCL54PVRJabZmp1KT7s=;
        b=KtLEXdpU8ZJF9lbY6wJKDyPkVMvKqaawhLWLiyQ9QUi0IhFKUOBKBAfLsfh/wMujkR
         e7jVaynRcBcdHE5QQDhJnShQF6nFCYPO7zX0JwJ5L1ClRfGk1canPov6a0n0npg8mLmr
         596wNoSpqzCj8QAbv+HwXvH65qvkj38vmPTFPs0NeUDDo3z2+2uGNoS3hcS1G4QDo6q0
         aZ7tT4vxTjEKtJMQ2zz1QtLuDj5GcHQrxFS9h8s8ENt6Abu4yyALcKYnLsYc7kjrGGmd
         dm/DQ5+23VqRPQvcUGS2ZWOYWM/JB4t5QtxXm3gWw/L0b8WXlYPs12PYlbs0faJPkMpt
         xroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717222; x=1771322022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fE0JtBuPqrjoJF+XmMNOZcHSaCL54PVRJabZmp1KT7s=;
        b=WaZT9rkulPRSi/KDY4OTceEecC1zuJ4m0Twl1vlItoHNaAmjNxwAga8dPGYhbcXu3D
         boBR7n9S4skHoHqmClmk1hr/DkicUxMOtvLK1hvSuP9PRz8N6cClztEPnWl4ow9NAuj8
         ir2QauXw0MuYALDszRXmewV1cFjFy4ffZZbOgaSPte1M4luIRgwc3op5hK6k4MzSD8f2
         uFscJIOMYggP1TNL1iZCxtC6jQ7QBnTnKYdti1dmnOqqoBrF7Pi9C40sCSa41MAzoHbG
         W7bMvqYUfeAc2pQLcP+q5CUmhn3nkhEcQqIqL0H9MWFpG7rAXWS17N/NiH6wgN7X6vTn
         SCCw==
X-Forwarded-Encrypted: i=1; AJvYcCWp2G+AdVklq9JeTm7khbZkrG9ArhX8gPEVr3FA9xCR7i4XM0Lysl9K3d2J8A7UxzfdzWdSRo61swy85I05@vger.kernel.org
X-Gm-Message-State: AOJu0YyGG5J3QmY3sHppOgF55Q/Lv8/mRgu7aulDQXgGUaBfs4B7Fl5t
	0O1+0fPV+7qdbW/4SE6IDuY5HiBLLXPipjKe0sepyi3bYz9isWKveXN/rCOViXdLE5QTQkdc1NT
	TDiw86QMiUaPl/0isKLdtZY738VPYnJgVrSfKmCzIIHfyHC6ZEuqWwz1RsQs+UMVM7O/A
X-Gm-Gg: AZuq6aJrQb3tjUvZsfD50Vcagbrn5B8jpAUiMMCxxreVEGgaQ7ccYsplqcBGt1QhByU
	kJuCsn0S/TQlRcuzKyIvqHfrIV/zNcwATOafHtzrGnLK5xa6nzAuyp7lMirtBSZ+q1D/eMY4lMw
	xV2hm2TRxVBdtZAVL7vrUCqujRxPEpwLnwjzTMBe/afIjxllavfwPOlWb2n7vj4nRGUE6yJxXZ5
	4x9aIDMGySSuZZusvWXEZ/ZTSAD6hPz75oFr5nCxadMLbtd7UF1ZPbmIAmNuok1GRcXJkXV/jM3
	YmD+kWrK9/uKNFHnBU5s13usnzyxh87h8cPKomIwB9Qia8W0GcAJSfVjDyvsCjpm+69sCFhgFYD
	V8fr9ADdkUxK7JSFAro9NoaWSE4Cgj8L3vOiMpi7Y7zLew4haLJ+6MMVkGhLwMQZzw0MadmnNtA
	2/tk4=
X-Received: by 2002:a0c:e011:0:b0:894:9309:a2b with SMTP id 6a1803df08f44-8970fce3f4amr8470486d6.1.1770717222189;
        Tue, 10 Feb 2026 01:53:42 -0800 (PST)
X-Received: by 2002:a0c:e011:0:b0:894:9309:a2b with SMTP id 6a1803df08f44-8970fce3f4amr8470236d6.1.1770717221750;
        Tue, 10 Feb 2026 01:53:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983e5f42esm3741334a12.0.2026.02.10.01.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:53:40 -0800 (PST)
Message-ID: <3127c126-5387-4436-b4e6-694c1354ce23@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:53:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
 <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 029m_lzos8a4lkkb9QB8EFqzBYAfGL44
X-Proofpoint-ORIG-GUID: 029m_lzos8a4lkkb9QB8EFqzBYAfGL44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MiBTYWx0ZWRfX+KWTiIRcXOhc
 lXWaHUJOViw8eGRGvFDfEVgw+eb9KAC0R0qkoXTGuVAibE7Be73o5hdIkiI77/5KkXKAA6iXBwV
 2GYlJyJqMu9WCBqSJWhD+V+vBIEqhFtY8TVpB66If8+a7oF/Ng62nXrIKFd2rUSJCWrQNLQvPOC
 OzuktmXgcNsOCtu9F4I8d8jJ89VwPQdSHzNRcS/yZpn95zmJnIPYr/Biu6thSOrzD5IF8qN2B72
 tyiBPhOQDaa7uvVKjPLcQ3IH8s19ji7UqSpD191vDaCYDWEKpzabc3Gv6qo6CyMYiNSmQ8tboVo
 LDuUVFFhNX5dj3LeA3CtkRHKUk8lPVmXLQV+ixsLJ0LIHjwaVfltaJMExZndg5hgpGaz8F0uspS
 9mpw/u+l+2d8cq1udrbelJsh3sx2gqMsdA1bg5I8EnQ7+Y0/MptP+nSQDpFH4WSHJ6x/w+8YWQH
 l+opFMcl7Lx3zeffv2A==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698b0026 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92464-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3371F11940B
X-Rspamd-Action: no action

On 1/27/26 8:15 AM, Taniya Das wrote:
> Support the graphics clock controller for Glymur for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Update the compatible for Graphics GX Clock Controller for Glymur as the
> GX clock controller is a reuse of the Kaanapali driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


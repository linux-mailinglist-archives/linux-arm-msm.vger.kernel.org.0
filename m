Return-Path: <linux-arm-msm+bounces-110489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKZoCAvtHGrlUAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 04:23:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE650618CFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 04:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FBAE300FFBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 02:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AF9220F3E;
	Mon,  1 Jun 2026 02:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2MsvTkt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMbeYrYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C5126C03
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 02:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280578; cv=none; b=kaTSgwV3YXnwpuIVC+K0O6fzFnudhEU1NnU8roeJzx3C8DNbpX8CHhY0a0OFc8DeSODtUPt15XIHv7oeK+gFaGrHvfI06u/9jR9Q9H7pIGoe7Vj+1l3/SkviLkQwJHo9jgJP7rlRBbIHXWcXBOBrarAj+NgWv57xa2idvuxTxUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280578; c=relaxed/simple;
	bh=cg0MnCS56NN8ew+Jxil9Tc+Gmjvxv8wsDw+u21d7vCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXZ7sldohK03IAdtLr9upK0q4k6GjNoY6Kb+SmyRG0ByoBOM00UgcP5SaymSvlejaRhAMm5fPDYYQQGtY56mO/tjROIxFJd9ZT9w8tbRAoo9+89jkntJSDSbtflxrCXJOrebtRVpT2r5gfWqWw6MgbRNCtI9/W9w7lyI7stIVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2MsvTkt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMbeYrYF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VHJ6vo2173952
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 02:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dm9sRWUFHRjwKU05/c/rPrwtLtbxao/8L9evJey7ugU=; b=B2MsvTktmF6zJ5rY
	i1MwyuPRFQcp/C1gwxCoAc7PXHoV3qQ1rVdtoF5mBXnTryeqAQBAaUfjohEFsM5o
	QOt/rAqIxCODqx3d+WS4mlMz2PgGwzkPMBLBq+KPSl0p/o88fgPOyot8wA1wp1V/
	q8sBRk8EVF38qq4vn+unhiH6jX0pEY3TTIGK9K76QAhJGzGVzBPJFDkGJgNefEwf
	DOsMc415y6IZrgtC4uUc2yxmjxynZD2VF/Xn2rWfvXgK2ykVzb4fKyKNO93nAgy5
	0HUT7mLrJLoLtNEu6KCAUppSPQ1y88iRfotbS3Xtup9ioUykncH8Pp0L70WC9aTp
	Bn3yjg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7vh11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 02:22:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9d265308so2673214a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 19:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780280576; x=1780885376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dm9sRWUFHRjwKU05/c/rPrwtLtbxao/8L9evJey7ugU=;
        b=cMbeYrYFdnhO7XTezYEOTpgT/pH9qQunokpizufzMuH7Fz7m9sh1iOJkRmUkjOsehw
         j+rJuWGiy0kg+AnbK3i9+8c81HcGxlGSJVATzPhS0gm4TIQcdE3WeA8f9hpl+qX+U88k
         YUuahEue1xHbm+uHscVZ3AaUK/0r6vo88h2qyEK6DSlh/xLtdpAD4HblinglOAIJ8lcd
         6KJpJF1WU27nuG0uhTlPYcwj/U/Vga2bp9KlXSBzE+VDWiA47/8HV3XR7Z3QPhCZ4AT8
         moy3nWyztHJgdCcSFJvgemU3ZfpjFcRDfDwSubcsqQf0y7LZC+vUMI3+GNjfOkokXHsp
         Z1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780280576; x=1780885376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm9sRWUFHRjwKU05/c/rPrwtLtbxao/8L9evJey7ugU=;
        b=Dc5M2uzA3+JdLzDNQtv7V4tiV8D5kdPibIRd7CDNx/BkqjCW6Md+iW01yFkzmC/aCg
         MNAEOtZa3CyZvbABgclt+3j6gHFo5JjtEjt7WpYLri4haP1aGZaBdVWExRi7MTI9X93Y
         XFWBLN1qorJ7eLdzajJJ5ce68MaaSz0l4PANzn1pIL8iFqtKodQ84GsBsOThOLYoUOpn
         y1cbDuKzzTwaEWso8Uw1UVI73ls4sn3l1T5ENQlk66b/Lue3rhZRb2TjBp4UcgM5kfJS
         ezDSRH0/4hRU4kYzncnPFsL3uu6U3xu2zi8ZP0GELCWcdqpyFPIdDNTPdn2jHw7ARcX+
         Kitw==
X-Forwarded-Encrypted: i=1; AFNElJ+oyUCYgdXron21I3OjGOkHmqoONkgz3x3agH02c/QgJLlvaeamzBnP6/po3/U4rsQNhsQf2JaxSsxRp1RQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDqcf7+pgQyRx3b1FdKRzWxL0u3KD6Ap6hZmWSwapUWwOLUxZ
	f01cZut1Ajdq/3pto/iQ2bbcl8DOpSb1q7Q1Tz0rmD+XXxZKqhiw8JLNAAyE1eXDfVw3ZG0wcjs
	BkLYnsKKUDLjINzIUQXVP3+wPLmV9h5owON82bjU+JXqdqKMTCRiiCLd7tl4IgZscIz+U
X-Gm-Gg: Acq92OHJlLqvL59X4NKO33I7LKShoXyp/IvjSGoVHAHnc3SveRfqZA7Wi8yNxu6Ihlc
	oo34peHCU3PsyLT3SMrImf9GArb4EIa+G0tn7wBPHJx69Ie90lJv37ABHIynhf6Cs1V5tVfNYcp
	3cb2vLzDpOGOIUyXS+91qttWO0JRsn+vqY9shsovzwNu3+Twh1TWy9GW95ZWTSIpl6XHtrrSalg
	QDRq3tFqvKb/CgA4/iHogPqNz33JXnAdFLjJBTSdzVFbduSagd+i76hmhW5zcDQuOhHtz6CXssK
	vvgXsBSnf0MjCrSdPQPIkGmBn1gcZaD/s5yrQcg8JLKI/VwoopdhqWANMyUpnqypOGS+EM+VG4Y
	Fb6Ysxl3s8ldlcA8QG3+1TbiWB2k44cAQL5gqAVZ5SMBWjfjy5mgtH3h1Ox0=
X-Received: by 2002:a17:90b:48c7:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-36d633ae92fmr7478618a91.3.1780280575649;
        Sun, 31 May 2026 19:22:55 -0700 (PDT)
X-Received: by 2002:a17:90b:48c7:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-36d633ae92fmr7478573a91.3.1780280575201;
        Sun, 31 May 2026 19:22:55 -0700 (PDT)
Received: from [10.239.132.75] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0bf8fc0sm9201256a91.13.2026.05.31.19.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 19:22:54 -0700 (PDT)
Message-ID: <bd38efa0-f170-4fad-bd56-d47aced88991@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 10:22:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the Maili
 AOSS side channel
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
 <20260524-maili-soc-binding-v1-3-fdf9f9ff1b23@oss.qualcomm.com>
 <20260530-swinging-wakeful-mole-359940@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260530-swinging-wakeful-mole-359940@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1ced00 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2PLRVYDuarSTPNz8X7EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAyMiBTYWx0ZWRfXxmJoREfRd8Ls
 m7A/8QW/6BqLhKqZbcq0RGw1+FsKcRfL49Wg1NlCyfoU40NTPQQlMB4vfJxE4AMUEqq0dWgG15U
 0McHBEQAPGsrYj9qrjYJ7LU2i8W3rJtcoOTt5074A+kHu6F9tmG+l/kN+mnCn6VVFDn6ftHDtRu
 nLA5idPobXg4cVgsVAEs9aW++cMTme5U0CrAVF/0rbcrbja8bAwF7eD9R33l9WWn7kR2BwagHPI
 fzdEjXd2tY00ZfXgtGxuFJAJBugwGGtvE18/WkxAybAbF/yjzSsW187AXz/8BPq/aNLyLyaGRuy
 4Zr/pXxQOVbgfxs5blhRVDGzcP6gpIdLrSly8us/rvCkYxOWqiPqR6LL1mFZdlgM5Xb3T0bHkF3
 5NghDppB02wPO4Uy8ZwSbzvbOfYX65O4uwhdNVS+QfXYoQGrB5L7abSGivKjJJwQiXnzKxQDxNb
 mHsDrmPcRhXbk4ARF3A==
X-Proofpoint-ORIG-GUID: D3lQ59m2d-GXhWbN8cRhn7X4b4BoQBf5
X-Proofpoint-GUID: D3lQ59m2d-GXhWbN8cRhn7X4b4BoQBf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010022
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110489-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE650618CFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/30/2026 7:22 PM, Krzysztof Kozlowski wrote:
> On Sun, May 24, 2026 at 11:29:46PM -0700, Jingyi Wang wrote:
>> From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>>
>> Document the Always-on Subsystem side channel on Qualcomm Maili SoC.
>>
>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> 
> Same comments. Also incomplete DCO.
> 

will fix.

Thanks,
Jingyi

> Best regards,
> Krzysztof
> 



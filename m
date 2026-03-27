Return-Path: <linux-arm-msm+bounces-100306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KMMDDWCxmkhLQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:12:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C4890344DCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37BB630391B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4B93E6392;
	Fri, 27 Mar 2026 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTDqPt6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNZ59oK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEE16BB5B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617006; cv=none; b=LKIF6C8HmOU+E+sUj10Jc25cH2Y4AKcKvy9SuS8HPWwReSx+l9GSYd+zuUn9nTLyHGhKOLEkP7Ug/p5z3BYsOqn3HYgIQZ8IxGatEwWWgyc4bWhtcGNjoYxCoBv9kJhzrxYDKbw97TXX/QlbiBLZpwgJK5wKEmHuu0sUM/cgQBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617006; c=relaxed/simple;
	bh=OR7A0CYYFZFRplPf3XDj4MKp9ETSFd0U+CSV1sqIg9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSXDvLHsYiyNivIMyr/IiQX2uIZEcc0xV/63A5WSVDxWVtQCkXsetX8NKbjkd4zY21/T6i0eayoUv+iwYEZIUGhporZgKzi1Ykt2bid6WjlkEfFhEh00DcJ2rWDcDFahHdl0UYiP0PI2zAGAaVPTgYvogAXdicMxPyEAGnXR+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTDqPt6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNZ59oK2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RClVNd2378956
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Go92zMhLOcK2bdJWTyPcYvvCCllne7feqkL0/kEMOYI=; b=mTDqPt6giiGGMqXS
	uXq+eWqAXeW+IWRKfzmRrlNxzWukPti9cpy9md1PBdhwp/xZWgphIIbCmpFgw794
	6+fVjZ0uuT1dwkNAANCd/+vSopkX/lf1y4hhgzfxr6HlS19xLpjreZsknKM33T+s
	SHagpjwvVptoF4H1nd2PlstN9hz3jXnefvpxBvDgx4K6ODMB5tV/g3TPrqneB2bw
	qEdiF9Bl52zrOB5LmFwQ74/1WN0K6ZwXYtkXT0ZOKoY0WiEnpiq+j7X0bd0k6ipv
	DWjOkx8dsbWc7Hyc3Dbt4MlSd4XkFoJWFygeHBgaWR7zbJYEmABaq15qvBDTEexn
	WaFF8Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx1xhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:10:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-604d88798f3so64868137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774617004; x=1775221804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go92zMhLOcK2bdJWTyPcYvvCCllne7feqkL0/kEMOYI=;
        b=cNZ59oK2h67mIqhQz7xwRnu2wurq96a8/+fxY4nSUxFi6avcOrJZEqOniiIht3ThTB
         jlUx4zJNDCrXGboll/LynvvUmqbo8mor5v+PwIb3XNsJg9fJWSFtr/OVc+NDQZCyQhMK
         dpVi4NDVVPsAf+MU0k7xDOCl9Sl40oSRVKdDb/Pfy2/lcabl5OXPGzktbFDXzBasE63d
         54Y1Pe6TF6lyxLeMbs7bpJRv1ClaiNTmn0820jaF43P/YKkY8XMufnfHIluf57bxmjE+
         YtJgUslPsKTmfBlS3LWbZ5mWTWX2ZkskjzkFGcoMxtkihVEiPpLf8Ci8WIX5tu5WO6Rf
         Z5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617004; x=1775221804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Go92zMhLOcK2bdJWTyPcYvvCCllne7feqkL0/kEMOYI=;
        b=KInd1YwjzyN+iErFDxFIyPqyi/qEAK4uvagO9sSk+tZJJLVZWYieL3ZVjitFXUV5o+
         Pj1iVxG69ueqHQiS2hSrb3E4ZQ35lMt9ya/vatxZlVDZLx2ZtXiBzcGRk6irUsoVBbWG
         69Uh+5JdzwgHXwz1oywnsmFJLRoG3vBI75Ww2p+439RAd4a2NoXVwNHtQ26udwk92yL9
         iOFuy7N/GGwSnfXthCTt+mO3K9fJUkQcMdqCgaLhO2gahD/2oj96neGIkSVef8eJtal0
         6OmBEn3CA4pMKQaAqfHCdJSsIAuMSCzaabQnzRcxt8zQwDybwiLTc/zsljVGqEYCe9ow
         fLSA==
X-Gm-Message-State: AOJu0YzKg5q5tJjr7lSIHiJjRBxustCvdBwFW9c7C2R0AGJ/0wVRXnRf
	rtOMTx/HrI46SZrNB2fEj+JQOElbS/GyiPkEvS1bp73cW4+1uooYmRw2b7xh0IXCCHTbNmmAk+B
	4rrqNAFl8BD2+Ay9uHyjZ7Uc27aXSgVMUBOiiZo+pnUDZe5PEjcvjZA7b33RqTqUbtp2u
X-Gm-Gg: ATEYQzxosbCiEN5aZT76P1o2EQBPscm1uR02pPo8K2HPCAU9hEJyYA4xRh6gxA8pTQs
	zNOtTr4Jh87REMxep0lDpKSSBk2LXh5oVcpsl5Fga8ehNuc4CEkTW1frazUWta9X702FwDK8Fm7
	J9hAkE14a2G0R5xuZTLLcdmPZSJYJ9v7V8HGD8XCUM2L7tMvzrUNoQXQMSpLe5og0pBuyRoO6VJ
	QM92N1okRi71rNeNJXd6r286Nc/WsokgsG15BTHTGZhxYdUv7fK900bS6YsI8TPCujS3XjhKNye
	mTD3LBAZAeEw0mfRiFUmeX1jFftJkT9/dV4wQMBYBmFVynNkxBxCs02Ojh4WGssfhp0Ys8XcC3K
	SFXWaVLMwpkIO4ZBxy623IcbNrIvdX/uqnB0MF2luPN/p+iJ8zSUI1UOZjbTCo8Vs93zi0eY+KJ
	KtE40=
X-Received: by 2002:a05:6102:358e:b0:5db:f553:4ca0 with SMTP id ada2fe7eead31-604f8ffd2fbmr500364137.1.1774617003852;
        Fri, 27 Mar 2026 06:10:03 -0700 (PDT)
X-Received: by 2002:a05:6102:358e:b0:5db:f553:4ca0 with SMTP id ada2fe7eead31-604f8ffd2fbmr500349137.1.1774617003421;
        Fri, 27 Mar 2026 06:10:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6c568cfsm2269086a12.30.2026.03.27.06.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:10:01 -0700 (PDT)
Message-ID: <e1d54a0c-dcaa-44e7-8a30-7a575f7433d2@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:09:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c681ac cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eypNieujGm-Z0LZePf0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: di4IUr4KW0ZeRM7NMKxzFg_9ZtH4j35a
X-Proofpoint-ORIG-GUID: di4IUr4KW0ZeRM7NMKxzFg_9ZtH4j35a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OSBTYWx0ZWRfX4sRZ6JM1BSc9
 q8ojkgxs/thKDyx9+U/ekjZLNqg61GeZUuT0xrjlTz6sv4QDTw6Km9G3GF5kBijoqsiLpX87tnM
 uaPADMjPYqXwNc13Iv7s/EhmiYLv2VaDLsP1WoLZuTjuZnr+pQQ5F7fheqBrLDiN2RMMlZeuATB
 JQPt4PT3EE8xJwIjn6MKc1bCMeX9YA3o0vwRyJreN2VfZu0P/67Q++WjP8icyUwUUEdEXy+l/qs
 TfggSW20lUU77qa6klIJ3GFVZSfRD5m+2REWp6KAoDfQBpC6bTo536BtsN5+9vkRXOkfmmdX0cR
 UgfgR0v9y0BZvDCCUAev81anYiVmOKTog//cR2HRNbM06xRBlK5HUu9Qz/BfKnyV08HnGQN+IhR
 9fPhFt9C+/20cmciQGvYnrFTzGLyH/EOT/TPNVzSB42NsbpV0KbUsu9Ltb4Y0h9+mSqIf5baWyR
 L1bK3wmRojG5XkMU4YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100306-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4890344DCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
> For some reason we ended up adding only 4 out of 11 compute cb's for
> CDSP, add the missing compute cb. This will also improve the end
> user-experience by enabling running multiple AI usecases in parallel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


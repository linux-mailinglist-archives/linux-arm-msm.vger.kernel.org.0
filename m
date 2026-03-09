Return-Path: <linux-arm-msm+bounces-96264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D4zMX/CrmmRIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:52:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2935C239309
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D67FE3124FE4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6CA3BE157;
	Mon,  9 Mar 2026 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROReoo0M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJAJeN6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB913BD625
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060362; cv=none; b=ewpt5MgWUHPlm0fDDlVo00P7cP8iySyqhiSEDgTAY5X67fiiNWCAlo+okJJXP1eNnBGBGSL5bMGqnKXU8RXdhuA5lxLxeGnoo1Q3oKmRVMks/XDM8+e2SZ5Y6QjeQ6yOPwzpoMldVJE8Yw+CsX6BKiIb9il2ad0bxmzAQl9Ojbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060362; c=relaxed/simple;
	bh=APhNgqo9woa+fcOfJJQUy8XbkDpAOEiu3v1ExUnD1xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KcfshRoQYThE2znyHFBo0sEfYU9s2jfHpWFeYrgWj8pBy1J7eE0nY0CKX9TgWGofGfZAwyzA3gR7wriwCNt+Qun/iTANq9TIfgjq6YbrfKPq7DcllQTMBpEn4yakMh6eioUVUxYQ/fSzWcxJjpvlIkb40ODAnKs6EwX8vxyaqE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROReoo0M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJAJeN6i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629B3Ws42986038
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=; b=ROReoo0MXa3SHxcQ
	h+ABp1i2quDUQ+GMylGjYGSws9QPYLqlo6eah4K/5vXekTfTVenTiFNRY1qHUnwi
	c3dZLFdMKaY2BRUwEpw7N8856E6iUObrdpJ1az1B9kRy7/THYJyapnsFv9zLsUB9
	RCXgRJQvKlELv1XOGlB5CWXKRD7HHcyI7HJfxqls3sn2amMSNcJGWxMhiA0OXQxy
	nq/1YIIlO27ttp3JtcS5X0Yu6FQPw3cHCDCA3JtK/2DcZmYFjTJhFN+K1YMm4ngf
	ffDs0esZXRmbfpSrzWJgj8Gdr/Z+aEZst9kH4yZE94kKH0EYgf/fomQQVc8lq7EU
	e4pM1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vddn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:46:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8e89d19bso34612785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060360; x=1773665160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=;
        b=YJAJeN6i1aUdWlJOrqesFvOt/Xwaa8NZq+lRQpPd6Iwa+RL7wTEA+XpU+dL3nzmq3L
         UN8h6YRDffqJXvsqPIAv7CA9oMa5ejMVE00IX+nmmxnPa8sBjPuYxJPNXZHVjgK1cGAx
         hHkITjKPi3mwo3uzCyflcGs0sX0oN8M3fzT59GSTSg8Zi+OxMsI0W0zHMYp80H7hOr4Y
         gX8xbTm5kUsKVV4a0I4WDZIdqblvl1yBuLRnm9v1n2SvJNWVa+cjxsURmTcJe/NVh/Qu
         ccRvkmIiAMXRn1JTOYU4wfFO+A9yzjp1LLEs+e0qT4e6mPZmgLG4oU5DZDJS52lp79yy
         nP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060360; x=1773665160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=;
        b=NLIjwobyAF7MhWljlba4WHDTQZJHqA4/5iwuQL3oUbWRW/qzbN4Nb/u1Xh+97jMRhQ
         XRpR/uy24FEmO7kwPNPU1U4HwqZr4p+A6ZbpSZZOO2zrHWYsrVBbMS8MVRHmJv171HDG
         PBHtgud/XwAZerOuNlKBN9ySwNt8UoHyZscbuyxUunCHIdXFFddKroA8zvd14L+fxg8r
         S25TmgdmplIVRUiYHFAiVQ3IN+kocUoOtaXFdcSwg/rvhYMbRckE585EgCkFOMwW0ymj
         Fdy9fI3iuJa2MZH+StgLPBGW7TFngwuYaV6ftbV3KiIfyHlemM9w9bWvIi8S7jEILmrv
         +hGQ==
X-Gm-Message-State: AOJu0Yy7GwH/KywALoEuuWRq2Kb2S4dr2CUnuX9D1BxpTHiQrNsz5GKn
	WypMohsNJc1W9SInXg1od7W4FiKC4856VYoLs503+m9DuAGXMUvTJx5PArN5VykC6q/enfqKyqQ
	abVZ4zsHsOx+3apyxEa+jIjpWaEaY0bqkWvjMKRMf8F+KLIBppT+c5wQFw6428XqhvdZV
X-Gm-Gg: ATEYQzy/Oa+IPqvg/vATnABpRwrQxDET0v7UdngAsm90umH1jEFzIUR20mWYBYjT5xo
	4edQUlGy/iiL3CtO0x2Gl92y0V6XVnVo5yKqxYCnOC9Gc8I4p2swWTPrSLlXLAMe7n7hOE1pe85
	iELizPse1bs7ebkvYhORZjp3ZMQjFFpStp42SUp+Pqj4QWmYWguyWL5gDr7n8SeQe5Q1gqm3nW0
	mdZ+WI7QLOj55upDitClgGF6adSW9+1lOk9kLqa3R6p4RZJezltWmZRQg7UVaCFJdoSVxS545IH
	ig2TCrYJstl9hYuC6IJI9EiXJlEgE/FAMRDuf0nfG7w1UPysZbO3xs210hwzfkIq2BFuWfSFoax
	R3o5dcEv9BuJz8Hvdn0JxKiT99zVgll+DnNWtyGRADyu/Ve73JTyOvt4NiMCulf33+A7Ud8KTG/
	dPALQ=
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cd6d350fa7mr1065405285a.3.1773060359871;
        Mon, 09 Mar 2026 05:45:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cd6d350fa7mr1065402385a.3.1773060359436;
        Mon, 09 Mar 2026 05:45:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a55a660csm3141140a12.33.2026.03.09.05.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:45:58 -0700 (PDT)
Message-ID: <9a67cc73-755f-449b-9be7-b8380eaff4e2@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:45:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] drm/msm/dp: Fix the ISR_* enum values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <20260305-hpd-refactor-v4-2-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-2-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rMalb3JFqBWEGU6Y0TYTqQqwIpqdPPrp
X-Proofpoint-GUID: rMalb3JFqBWEGU6Y0TYTqQqwIpqdPPrp
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aec108 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hxhQaWjiUK3sto3hAJ4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX3YEqxHScREy7
 AfqSU2DweLC9TVUUJoRGkf5EFKc4zsZijKdckqAfjYYvaCyw9EWy7ZWZu+FzT1CeuGNT6y9uWLI
 7oV14zE8qcYd0yRZMjMtFR4J3K2m/Fnu3G/dajCLWvCezy9IZkVQYoosktMnBXP9zT6aiAxeAdy
 mpT3gFBWcVSlwtvjuBJP7e58izHKTaDZSBCFidl+gPcijaNrIZnPeFv7uUfLrS4/+miBegbEQg4
 ZU26gHER+NLxFf+PafOs8i/ObF/v15wiAqHkZrzytynjKN8RNqGHFmweqoanuQyiKXRQHVwAwxi
 1zNcFV5ObvGsmSfYG1bAtLEY9ssa0nWrCe8EGY1rUjPn0iovfa/wKSSXpe51+C0JP2an9wLhlrB
 euoKckRoTU1cyWGQmwpfoXtwEqo3n37kZY7VZQgWrHi5FBiuhRCGsMQYpLQvv9CEXfEiJTaBlkv
 8k2aP7zLp893iKR6/AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-Rspamd-Queue-Id: 2935C239309
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96264-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.934];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The ISR_HPD_* enum should represent values that can be read from the
> REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
> ISR_HPD_REPLUG_COUNT to map them correctly to register values.
> 
> While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


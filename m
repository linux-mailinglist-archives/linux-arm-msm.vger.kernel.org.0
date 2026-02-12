Return-Path: <linux-arm-msm+bounces-92669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJQeBO+tjWmz5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:39:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C600C12C994
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0944302CD22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B10C2EF65C;
	Thu, 12 Feb 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWERFoRA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHRUxye3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA8B2EDD4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892779; cv=none; b=QCILm5VXqk0V0vkT2xMDpGxDb4K25WaL6Nt0yh87tYxpy5xrWekpKXesY3pn8cdUk0e4ETMk6GjTta9Oip9Tt5XgaZtpfzckTdvFJNfGr3Au8+FKtzXefoWDZDzEyJnA5mbSZMGVQ15U8Skrg6Ufu//XAccHvxmnezsGbL6OSrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892779; c=relaxed/simple;
	bh=7LOkl42MOZQ0quhglrqHfwok4kY3GYiR6zb7RMj3UpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZVs21elHTEEWMG4i0uqhZNnx7M/qjdiPWsDgkCpEym8gfq4yHsnQDqqlv5sQzakPiqSob/TdJSuUbqbdUArjLkXiQtJFaoEm3V6iRorI2oHUweDlQn6FBjsM6+Zn+h/C3y3hv95JVJEfGWPzLwNX7JPWt3WsVHoVyGIPH2blSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWERFoRA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHRUxye3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAFkmh008881
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZGvX4oyk2EBMQUN/9Ti7n0R+ck/vVDWYJLmdabfyuQ=; b=DWERFoRAksaGi0a4
	OA0wMuzTeHMZkgDE8JXP/dsB4uq3GF8wMYW7mdlsDq5agy7/B1emRvVD+nXey8C0
	d7Mb3e1M7+Piwp+LyQK+CQ9lEgdwI6SM6FDgXabsw4wxFnUweIi9b56tgf6PeR1U
	4DGovUKPw/LZMAO73pRZPX1u3ShkCSfM72hR+jBkq/9sadh6N5DzRgz9asudsJ6V
	o8nGf9wz85Gw2NernP6wt+w2khu4Zgocjk0qHGXm1qDzRSMU+m13hwG88IT4Vav4
	/EGUVFWZtXi7Q+P9QLMI0S17HmsDNmLvKeq965iYST519AMqdQFJF7Kenjz++vVI
	wxNJzA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cy4829d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:39:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-897193937baso9172146d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770892776; x=1771497576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZGvX4oyk2EBMQUN/9Ti7n0R+ck/vVDWYJLmdabfyuQ=;
        b=XHRUxye3/j9SJ80A98ccs3EFFB0Xt4RYOyu+4wDB8+fbpJXs0hynOKd9AivJB/30Js
         TflfzQcO75HtwFlyoWgWAq8TmH3MDuyGQ95l7P5s2DcW0rvZC0vukI0LglZsDHSkL9Tz
         Uq2i0njXq1RwA+CtiELUvCvuJRl1fsc34Npc7PQEqLjOeu1xkJXDrPgtfybkqbt50o49
         Gy9h0hpPvWLEDPTFxTccbRSrdkzJZxUsKKZyOZkt5rtGzhtXodNgszt6Fye3ej/OZvMf
         9UYfPOMc1Cu8i63ugjBd8fIHxNFbnaDvE1FjW4tIVVjXoPY++ikB7vNC3dB4a1KUzWTo
         h//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892776; x=1771497576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZGvX4oyk2EBMQUN/9Ti7n0R+ck/vVDWYJLmdabfyuQ=;
        b=YOJtP26tULMQYDu38YDLMBkoA7UYEALjFn5YwqxHtu9SJjPUZQT9VznItE5As+FEHE
         vc+3nnK8uFvVtCi86oKSBroxQfm0rRq3y1F2XEh50BR5yY6fJjWVHqALfWok00htWI4u
         OlfcYgynsKJun7aL2rVNKCfhdRXRkGaj4jwUyz3u2yDVoWC+7xs1pD//fs96P5fULCjb
         painDpoBvEnMeryMqe1d8n05RCuCGUEWL2JnqFsBQSmoAbqFaMwEU2E2XU8R3qjGDx42
         iGPLoGOAswk5M38bRLk1tIc6pkekYcNiLXqjDaZ56HOlNUcuq249ZdYr4D1wXTnkzfNj
         QqwA==
X-Forwarded-Encrypted: i=1; AJvYcCWBOnpc4bAnW841VcBFaxmXY3oJu7kEzGam+qLLcBznAf+SxaQRKMWHw+2yr0HWhXTq57CqOUee0rrlxS9k@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUxNwFSC6fOeCqk5xIeWXuSsJ0Vi/lao21CK3aGwdH6sFyISG
	oL1E0tlVYLEfPnjcG/8u7hwT9+m7gQwyJkyIMp29U/KpogwlKIh+ALMxYhyUsmzKtX7UwFj5jhS
	IELt6/tENSTQdYbrwUs0jqT407FAmWAvSByOlDJ84oaUVdDZOaEfisN4kW7mAJzegZv73
X-Gm-Gg: AZuq6aIZHNbijeg5Awzo2kUmLbg1jlKBiOUvtS9CMZ3HoKSUEY0zdfHGOujQ0/TXnYh
	9uA3RmcGYWOV8pectMCPtzsOVbbuPQ5GuCmT56uS4CXvIO8xft+5q/owDKWbfOVUZOPjFa8AqBH
	27zJOjmRCoLCWCT00ffE0TK28q37GvgnzpXh/bbdao1oBEYQ9cimG0CbCwnhYLTRUJFkDvcfRL4
	aC3sOn3DVgIMsSjJ/ROIs4som8E2GBsX/pZRllV8JRUxcebfueg5Cody4rjFieaHqEKtCCGOviP
	xpQI6Khc9lvUNlg41mIu7fb5NVfp9rg85Lj61BTJPH6LWfXsng98Z49ORARNUDJqSqhRaiGnFTb
	Sp/M0RN20iCiHpRiuIoCJ7Ax7EeHpbipkzoCrCEN47/UqIxBcOBBoIacYueyNXmmIQ+zIGNg0kM
	wNF6E=
X-Received: by 2002:a05:6214:6105:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-89727999b22mr24108496d6.5.1770892776430;
        Thu, 12 Feb 2026 02:39:36 -0800 (PST)
X-Received: by 2002:a05:6214:6105:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-89727999b22mr24108266d6.5.1770892775976;
        Thu, 12 Feb 2026 02:39:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf45bc8sm1618165a12.26.2026.02.12.02.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:39:34 -0800 (PST)
Message-ID: <ee24a8c5-c659-46d3-a043-1c681a2245fd@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:39:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gvE3g5ojMd51q1rG1YRqSL_WRAmFzSHw
X-Proofpoint-GUID: gvE3g5ojMd51q1rG1YRqSL_WRAmFzSHw
X-Authority-Analysis: v=2.4 cv=XvX3+FF9 c=1 sm=1 tr=0 ts=698dade9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ly4eFjZ7uZWBmfg-hx0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3OSBTYWx0ZWRfX401L4sOj90wa
 7OuW3dEM2E44nGKySEeUicEdJoh/5Sas8ikHmi+1T8OYYFo55USy+cpRVIusdevMrF2Xo0I0wYi
 Cz8RK0EW2/RTC/hHKn6XZ8vuWJROGdg7PsBD5rkfqAaRwU10/NMiJw3+zKAS47mccces5N5hvX3
 Q0W0UzS5Uw0HaJEZrAiEN5pWpZg+zpygAMqHUaDU/9TdmFLVPEe2dIrj4ayaS2gfXc9Wl7qVuYZ
 JXFMys/TinmhpQcZ59Pufv8yKSjhhNBTO4RUR1bBKB7O+qIlSU0/LEjatFDWo7+4j+d9DQ99P2h
 fdjacIBkGE4N5oYADBEvRK6g/ylZOje1fwmRy2OYYB+W5lrnKkirF6qoHKbxjXP8+ySCFqhYDEJ
 X0WJnp9fHqdaJwsV1v+q3/0LmwalYSJ0mr1OmXruFBB4KB4OZ9cr00G6oHNPAVkSX1vhOv/gJ/Q
 TAcgP7n2l6G+eY00nag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92669-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C600C12C994
X-Rspamd-Action: no action

On 2/11/26 7:22 PM, Taniya Das wrote:
> The LNBBCLK3 clock used by the UFS controller runs at 38.4 MHz.
> Update the divider value to generate the correct output frequency.
> 
> Fixes: 874bc7be1e08 ("clk: qcom: rpmh: Add support for X1E80100 rpmh clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


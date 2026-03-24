Return-Path: <linux-arm-msm+bounces-99625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKj0DjlvwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:02:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A10306F14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3725E3038F21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13483E5560;
	Tue, 24 Mar 2026 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nf+OGYvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDvshkZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8F13DF00F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349700; cv=none; b=fVyv+pA8bnMM/2UDv+5auGJmaU4E9dcGgTVC6gcRbhAcZOeYxKii1kFCN76lAYW0hvBBd2j1uORi+ptQH2g05NXVSJBvCjQQKyQ3zmxDrk40cuExrVvKjtPHw0firFPa/Ggq8ELcYONLGrvOZW6xFsfxnZ01tbcvijH8+lCMTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349700; c=relaxed/simple;
	bh=0NnB1MgNMR7uoJP6UWxzFUtlEQ+YNOOro6F0g/G5eqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDkOr5bAiXa389ysqn01qPqNHhVsRrd1A2YKF5jnFiMEwEeY7bXxC8DyCoE9OokUJjMrwJFcSewyUBeo7aW3MJPGgjuLyKyOmtUQQrg9eMX2TjsWcbQvow0GXtGWdSXCAQTk582DMHt21bdc0mBhNV06fLnj9vsI95MRLPHMq9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nf+OGYvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDvshkZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9tvkx3903733
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dXF0IWEVhz/9ecP7wtx55JEEj+8kMK1bOYfgNiXuyM=; b=Nf+OGYvMIMjfsJaL
	MQAUHpWaesAXfDQqXr4BVEphIJD/PqFR1wn9CwK55Lzl187riePgomaY7+q3rfkm
	EOh/0odQPSwtxL7NS2kPLKQPVJSGXbQJ0DAxOj3WQOhZzm6EVYaHFbwJfV4xX1RS
	Rd+JLzXa2kTicwHMJdQDFDbIYvX0wDKS1NtiI+A9Fgfp9fxroLzpKPabJV1V0xhw
	1YVzfwUyXCIM9bDSlrHQTVt3KUJ0/38LPr0TvCkcMbilS30k6vI64RmP2zgaYvHJ
	55qcd6p+Y6XbBAu9BZKQJrkv3FRnTgzbUPynvRn8pNr9AL2SBfQcQFLadCNO3MrR
	zbcVmg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0hh5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:54:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so49064641cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349698; x=1774954498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dXF0IWEVhz/9ecP7wtx55JEEj+8kMK1bOYfgNiXuyM=;
        b=JDvshkZMeJpVasQbXAh+m5wheY78ZgL8CRzaGcv2MrEp35q6ZkMPd9oBEqFo4ba6L2
         5JnIvzk4M2O1wL2XCnFGtY9Q4NM+5t6OkNU6tV2hFzzD2WLy5/+WG9sWDZoazcYNPE8k
         LxglZ4dc9rBOK0Wu+CpqZ2G+5XwaIYfwxgdBReQ2pm48QXWM4v/vPTnoJzvCg2G13+9U
         kRCXdtQgrlflzX3EGuRH/yr37UsNu/H55i+jLuo6NZtquq4vyjDMVQxLigGgNL8mtCQI
         0AaSqiHn+IWS6ChP1FlVRDPrm74VkgPhS6HJ4GCI+kHcza0Xu/jSijiQcELHgKwpfdyp
         DcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349698; x=1774954498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dXF0IWEVhz/9ecP7wtx55JEEj+8kMK1bOYfgNiXuyM=;
        b=bghiUJdl/Gw6wkc+Hgg0H6ixf83z9086RVIms21hA14PMNrj0PnPSPSrm+8vwX+zZz
         Mj2C+i7qx4v0LDaiUjK8Ff5jv8nKWycKYWPQ6PTREHs/pqsylLNRmOCzW1CLyZNlQlx4
         UT/9y9HJzNlh9BCUnq1UzWFAvzJ+LtoZiCunZ9tTRCB1UfknT3GhsLuJQmQvAx0tZbTs
         RY/KT/YDAgFBc9cTjHgHWKV8grONPKA9qv6NHdvcFMEZNDo95umsrOxHna71ZqwlFrnY
         Rk62bB4d/w4Da40OEXFZx+tUFFwYZ3fIGX2UIxVlScBp6riC7cPULR8zaZdqjbvx4ogP
         g4sw==
X-Gm-Message-State: AOJu0YyF8ERj0L/Q9z/0fEvAQ432DGE47FRaF+5lEfJ/BRItHCqBLeTb
	EJxHjU8NZMc0VTMJQvFNBSUAKO1DXj9bgd4efAKlrlZu36v+USAv17mI3j2oqgB1DPlSIRWh0yo
	kEdR4qLfZIJPWJgF6/2LQnYZmRO38dEX/GinNUHhDIpJ/PC4+kwW/IlEqHYGKXGtt4Y6O
X-Gm-Gg: ATEYQzwRu50NMBV4gsZRwu8jC9Ux2W6I7sFk6pxXaH5rlolpTdecW4wMHM5M7DcrZkr
	2XSudUBOLHig+GHJbW1MIVSFePA6ECqNn27q5Q+6Bsd400bcohLNXDYaO1yew+d1IlT+6rUWshV
	HfcutGdqg/FZtyMbYtTnj9Rg9Nr2ZXI3Y/MuA/GJswzZLxm/KsmQlaQzgzkoddoz8rosmpcW6JA
	zrSgjw+9fWQwIj1lRBMdBv8Zf/LyrJmV1jCAcDPj8rCW2h/uuQBUfZqiVTt+ARgD+w/OsY34uZi
	GDbTz9JC8K6jGaZ7XNU9KqvDfx1QWXfFc827O/W2gnxQSRMZSud8W2Cxv1MgMr3PylhsxZ/TK0l
	rD8zEyStAkc5Ar3SsZcYLL6vfvwU1rc/w0Q4AnNRiTcWhTSug5W4PHt2jxIM6Lv11zCeozKBk0Z
	RIC0E=
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr32954471cf.9.1774349697714;
        Tue, 24 Mar 2026 03:54:57 -0700 (PDT)
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr32954271cf.9.1774349697244;
        Tue, 24 Mar 2026 03:54:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a166sm628563566b.42.2026.03.24.03.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:54:56 -0700 (PDT)
Message-ID: <f3d76c8b-17c2-4be6-a205-c163816ebfa4@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:54:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] interconnect: qcom: icc-rpm: allow overwriting
 get_bw callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <20260324-msm8974-icc-v2-4-527280043ad8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-4-527280043ad8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -n95CDsdcGLlR_SyyDhgpR92WrF6SIlg
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c26d82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QE2Rp95VnyMwAnmAKP8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -n95CDsdcGLlR_SyyDhgpR92WrF6SIlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX+jKnj8W7qt2M
 3ufkyBD5s7lu/aVOTigw6zAAI/A5VzApAt82t9KNmQjmJpVghI7WRQb02ihomGlyRrL0jBtQEi5
 tPnFGJ1L49PniqCy+E0aZEnDcaobGmSXz4GElSypN+zGNhRnj+lTpm42y6AVPEFhKtBqy5tKKvz
 8iouclbDhD1XS1UtK3/OCjpDM8Pb/b8BeIDz5O7esmMemN5MOpLskJSmzk2Vp96tgflPpt4AH8P
 AFbPiP36qXjUVpiDIhwxg6q/GUem/gLv8z/VLBkMVlXC2daI5FdXxLfAcEWU6s4t3nBVMf9OcGB
 oJ/wHlgv8KgWeCdTmRWUZwVf9Yk+HfvZfdGFDvDBvA6TKtnTBOc0ajs4Q8M+ymJjSCdqZmLoauF
 cuk83Kwly6URnEQP4WzL1r1hHDg5I69ZMtKSRL/4i0iFVNVD3s1sK0RZSounmQ2maQEJwjgRsUq
 QYF7buobx9fHNMbUifA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99625-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[dmitry.baryshkov.oss.qualcomm.com:query timed out,konrad.dybcio.oss.qualcomm.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F0A10306F14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 1:10 AM, Dmitry Baryshkov wrote:
> MSM8974 requires a separate get_bw callback, since on that platform
> increasing the clock rate for some of the NoCs during boot may lead to
> hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
> msm8974: Don't boost the NoC rate during boot").
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


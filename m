Return-Path: <linux-arm-msm+bounces-92988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPAuGyc0k2lx2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:13:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1AF145408
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8FD93039314
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D812135C5;
	Mon, 16 Feb 2026 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJt7McuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZGOGkV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1EA314B95
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254308; cv=none; b=CiVlxIYZFeNkkVu+2zNj6iA/FDq51+GHv799GCVjW8d9i5bdlUYtnlJ/QvHk294Nnt89KC8vxiwyRIqGHZ7KXyylyQ9GtH/unAi063Y6opnRG2UJ+EhuH4MUIuqoA3Bhig43DAbggsmHgk/a3oK5ntU2mRLQgKeH72zoFb8vaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254308; c=relaxed/simple;
	bh=8XPQXtALpMcNlT8oVo/KcnfeFxoRRAvfT762pQJfdAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inLtWbp64imHKCwW+s4JeWdCy49n1XW72fbcEAsINrhdDkS+BhyZb+ycnjlRqd2o40uCJqDHhQIXmHrtj2W0LhFfvZTnayhr/+R/HxDx4mNpUoEUEw+pbsKwxxVX6Yg+vVJefEEIQygaOfU45DHVUZQvRNsFK2XswsIFMK5GSXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJt7McuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZGOGkV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GCcIv63897339
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+/EAZwYzWfRc3ktkHNeIIfS83pbb/w/5aBpKlW3SWM=; b=bJt7McuHUrIg+Y9O
	s8uHmRdd2Fj3x5UbSOGSHPQkrYqOVUpCxBlwARfEMuljDQfLFNLfzRV8yku6AVr/
	+/g0kyGpDKoiRtpbgJ+68RuxfS7T5LQcdHPqeeTrsH3a0Kzoh1Y8V3mRNb/OE+XL
	k5j6QKPR3Ttjm4Wt0FOTmtovuAGYO5sVXl9GgclkhddYjjNQaq5X9AoZr+NdnAGH
	1OyYfS6jil/H83E+9fPD5w13REBXzQg1mvMeKn3PlVplaKgu0yx8Zxfg33XJe0Ep
	l5o/7dCAlvxDTOQ415tmgCmkIWErqq2d4l3KUAKbRjQezWJkWX8D+s3xDGIKSh2D
	uDzUGQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jcs2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:05:06 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5674752c350so198091e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 07:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771254305; x=1771859105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+/EAZwYzWfRc3ktkHNeIIfS83pbb/w/5aBpKlW3SWM=;
        b=EZGOGkV1kzIHH1wqBZefsoQhfnzrQXrQPWkAfv5W1OdTg1/MRl1aJuk+8UZgv8OMGs
         vhbQ7uFIJPf/Yd7X4fvlwFyF1hkcXkwYPYP46jpCH1xWmtUs3pyItpr3Zf5vM0f6qWTz
         oCvOuOzGxTkPraG6XokECk3/GUpgEp/VxWEqbOJjS+0Zd4Dt6y8XGz36ajWyqG1amD74
         wa9ILWkC+1sJl21l8fkjCSRIRNmKRkj0LZ8a2GHWJM7Yvvwa5knuPp9kZ/922Y0GUplF
         0jsw5L0BlBRLuj8Adj9HxrZOePxe57nV2gKNr5vNjYH/pm/TyieXlhqJ85PKV8XfseBe
         Iu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771254305; x=1771859105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+/EAZwYzWfRc3ktkHNeIIfS83pbb/w/5aBpKlW3SWM=;
        b=OsJWobAGrCgKmi0OCZbqYuSuiBS/8riDB4OnutRdI2eSJpq0wI1fiULM9MwXRri8jg
         hFVCfe7mJ2XGEScOQSgWvfrjXe7TR4wyMEnRlvYnKJVA7Q3mBybGlI9JIjXEYAO5BPtH
         ze9s2hcWOR6dz5G6vBMyaALpovXRvt8cmQHxfIm6dql2cWq3ltyz1CWgYMxSoe5wU7Mn
         1QhAzLNxNGtX+vNaDvrA6IBin3bFyjD31zkUWB+YIyn9ZVHJWjpG6P9+ah3Ruki0PJD9
         FXG0owN+q9Y9nV+rz7Dg1p/G3DMjfFe9JDXu+F/Qbeg8nW33svpcGqlPrPe+0F7h0bcQ
         ylzg==
X-Gm-Message-State: AOJu0Yyy/DGn5htBwNDkyg+wl3aWZ2rmVKFLm3QXxUdnwW3jLye0aXV3
	odpZZvTCR8ETT8FL2FSA6s78f7PKxWkDKAx+0arGA0kg3Myi/ZGk3sRRqrYtQxUe2pEGnHYR4Jg
	dbAw9+12C5J24jaX84Oqqi+gCL0USIUztlqrfinjepy/AipqMgv5j7WsuZsGGE1moYcxH
X-Gm-Gg: AZuq6aI1suIN6v5+4Tg/Gx/K/kDGXcQ7DPNeg8ff1sDr6bHPfOok9qUOaUohe7nqGtq
	8Q41SDiHKA7E5RaP3ziVq/g5txMv18HV3oVpP5jWYuwbFpskNjIMfQQXr22W7kQ473cmuhrv7O3
	ane/Xc6jpjMPolhe9JrCVFjD5e2Oag+F0DZDSBAtebUzKO8arFcfIjP9eZouq8QvQXoICaI+AVa
	p+I+b7jq1Bob7yNyTlh+J+MdUuEwvlIrhLDDC5sImkQWK8/sD3U4057ptnhow5P2bW0F+x2agsc
	wYiQN1ithOIIrxtcQAsuymgg+1mVMKhqENdS1bXn7z5sH1wPjq5XDLihdohNN1/+3khJRSbVYca
	S0N5ekJNBsz8o4LVlcbUxxRRTjjY5G0abjIuZOYOrg93sG7E6L6A0jYM8PrfwalvX3/EogiAv0Z
	ehq88=
X-Received: by 2002:a05:6122:8717:b0:566:3608:f8db with SMTP id 71dfb90a1353d-5676826540amr1386800e0c.2.1771254305023;
        Mon, 16 Feb 2026 07:05:05 -0800 (PST)
X-Received: by 2002:a05:6122:8717:b0:566:3608:f8db with SMTP id 71dfb90a1353d-5676826540amr1386784e0c.2.1771254304538;
        Mon, 16 Feb 2026 07:05:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm267294166b.30.2026.02.16.07.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:05:03 -0800 (PST)
Message-ID: <e21786fa-c32d-4012-b1e4-78cf88e2d1d6@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:05:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-4-8afc5a7e3a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-4-8afc5a7e3a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=69933222 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=QfZBNxv062MJluzyly8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyOCBTYWx0ZWRfX2N3DtH9qhtil
 kr06+esZ1zvtP38uw2IessZfAgN6/SS52qF3Bhrvoii1h960gjxsUh9e3tqI11k4p3ovf57j34z
 2OSX3HRWqUFi0wfZkehg1EcZp0xKBw3rciXqDqKDwxJwmduzuXZaZd/hIMGMxxTwlGofopZAffj
 jqNWHVsnopDUaX64b8Wtw8ZSk04NacPomCw4SBIx+BU1ltJQaSymlUhN6zFQ0OuJQXkBkszkmep
 wV22JvFBAE17oAINrXn0fXXQIDZQqhLPDRbgKcnfg5YDOnXqcEVSLcNMF8wNjLWWKBz9YcFo8Bz
 BkV3YtrJTbqz2yDdqbXLfDGLUrUjpcjMm39zRtlbXKVUhjjYefh3a1d0pItPXHBoQZp4XyuK3fO
 nnG8ssOP0uHWdLzPTgXcG9EeOl3EPnEY/j6uKGcvE5JItuCsqLEi8FIMEvPKfRo71BxX27CVj73
 i6O8QH6j42rcu//dALA==
X-Proofpoint-GUID: MWWvBVv5RpWbqpOKd-m4YyTL2rMc9Doa
X-Proofpoint-ORIG-GUID: MWWvBVv5RpWbqpOKd-m4YyTL2rMc9Doa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92988-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD1AF145408
X-Rspamd-Action: no action

On 2/16/26 2:43 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


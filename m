Return-Path: <linux-arm-msm+bounces-98704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC4YNF7Qu2k4owIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:30:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2F32C97F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40AE73093007
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020913B19D9;
	Thu, 19 Mar 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEkRwvdJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERCM1gEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3889E3B3C12
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915579; cv=none; b=HcZuvpwzmNlbWXuxKuCvcHaTN+6273dTVOuW5Ocf27SjB6SZYTaIXQBmcQtkkQyZcRUDZkunncX4CoioHdUMpfkBQyS4OTbeiCsLIesCkLfZ1lKJ5cza7IjJqhwdASgCpGvNngtX/u/J3BU/78fDdz+Gn6DlXhbvOJ6Z2m0MgWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915579; c=relaxed/simple;
	bh=ukykM17ynda0tSNsJoGRIO5G++N/U9yeZUlDGTGWX2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIdEa5cq30XsQjGB2an/BaYrIG/mTJsHOuBYijS2I7YZ76yOeAodiN3nxxa2sD8ur/uplbp8mTCScgRBJ+puMc+wF56u02ZfcAmjsoVNzjlM+1syqYDz3w0aPf2U2ddY3eMuaqa/gjTIcDekpUSI+rAP95Avy+z6VH6hau6RuxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEkRwvdJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERCM1gEc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73vBJ3771099
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLHZwIDtv8ewF5rx26EvXB64u7e8seD0rj6DZNBLKzI=; b=oEkRwvdJmyYBSpsr
	8YtY7Lp7ag+NLFUqNpLhe3gW8rekrr8gH2Nuw5OAdMTuV2MIr15FJcuvVhvJyGq9
	eHEkvWrAbhZ3g+K11L+ZicYNjA5+vteNyPTWf/v2YYiXJKOImG8Xuv9lvV33jKtB
	1FRQT9LC6RUYc4ezOYMZlqDbPfjziKa1Q1DNlemlhAVh4F+KjQOXzZR7a0ui4JAw
	I+6DTZ1HE6qsJhi1tIrWOL9skrXat2tb2SrzYX1KCJGztIovTPIw/2q/+YY3VaJ4
	+AWiiXipI7qj49rJj3Y0gKp547UQkIOcnhul3NBQHEjP3HzIoqbSUql4iOR9NaF6
	Al+Afg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r9buh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:19:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c4f6c45a7so5617356d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773915575; x=1774520375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLHZwIDtv8ewF5rx26EvXB64u7e8seD0rj6DZNBLKzI=;
        b=ERCM1gEcbc8J37FyscMhe/0tk2LbTVdtWlXzlpNEiUdTM/V5z1RLL+5qJfC4g8R+B7
         jWwXI7VY3Ag494VeV9YRs3y5XQX6pRrJYgW4xVUdFKyRseIRbeYqeCUZRKPtluz96xb5
         w/aO0TXyn9BX5mWwp/rW+92CQPwcIC9ytAE44bLyEkSLD8FdH63jpZGejpYOoccm0Ywp
         LMk4yQP1YHfcSSzEpfSx0VReZmDTkTbHO5rrtzVFG8E6AT/2StdkZM7eMS5aObWfYkB8
         7KPTWTGWAkUsA8nV6gYQW0jWsZpCkj33Ft7eL1/S7xEXYdwUpBQFaOA1WetUwy+1OKZn
         ho4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915575; x=1774520375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLHZwIDtv8ewF5rx26EvXB64u7e8seD0rj6DZNBLKzI=;
        b=OmOXy2NpX/UfWpFU1IJ7+MbyDD4N78FhLNE+7ViWsDkMOZVekwkC8TwdocbjrDYlKw
         soYZ0D6ZCtTT3YpE8izjFcmlhct57Hgd90JklSV40l6MeQBSqPqrq4vMVhiNhKMYHvPi
         ZvIvNis6Bxzy+N0I+KrF2vnFxkl64f81MOJWMo24Maw/v3lcDpejPgO29HEeTNpp3VfQ
         JlH+oKMYWFb6/Tjh+LmveMZDlgyZXcL+aTReMj79QpBGNPSWhm7+ZbQYd9z3TbDcIaYJ
         95DrwrkGQx8X++ft9lB1Z0VWgF87k13GfzzXSfCF1bg2dwTygyHQd/Sf54g00N6xKxR4
         EfKg==
X-Gm-Message-State: AOJu0YxuNDqs39sei1l4BD96IYCs68japUqPgqmGFvfSivGTlfjIbJdJ
	xaC5YTAdXzV9xTYnRWaCdTFWHbE1+2HI4tf9iztZqHVeeBRycu069cnRZVv347EOM2kNrpxLQZ5
	jA1keAuRWRQSx/yeEtud5cPgfoG42aWSetD7MFJQeRv/JytV58o8lIxEhLdHVH6BwW/MN
X-Gm-Gg: ATEYQzwtI9Q0FaTuYZ5+Co8YZwF61744SYzpSR3D8mSouuu0qsaDXhEsnnAxXO7OIMM
	KKR35ObMJnYyGHvRBALLuUnD8J+xgkuWzVIGcfI3rFGBW3fwbO01OBPdCSp5uiWRa1YrleTuhZ+
	7Iy3p9Wxl+VWyQfVl2ntsCTOSGgTxC4HxJwe94NWu7STp8u+iRqA3CWlqOcA++q44ZOJrUb5bBU
	9EY5t6ohVKvgBFMltLywnJ/bQ+Nb6V1Tl0MCBie+pV2J31SXQXtGrwsE+p5dUvyUW55QlWdn3J2
	7il2BmimYSF13oVsoCrIgourOr6gEgz3nlKELBAfPLucO75KPsSLBkodxBKESbgspuwmgusQrL9
	JLpUWYIxd0OrqV9hOKUaILOQEuZzXlZ4oMmaAara4kJxWfstNi2CFaSNUFheObFphTy/eeOM5fZ
	flo1k=
X-Received: by 2002:ad4:5949:0:b0:89a:4f20:c1b0 with SMTP id 6a1803df08f44-89c6b499f93mr79608016d6.1.1773915575323;
        Thu, 19 Mar 2026 03:19:35 -0700 (PDT)
X-Received: by 2002:ad4:5949:0:b0:89a:4f20:c1b0 with SMTP id 6a1803df08f44-89c6b499f93mr79607716d6.1.1773915574838;
        Thu, 19 Mar 2026 03:19:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142b8efsm443372966b.17.2026.03.19.03.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:19:34 -0700 (PDT)
Message-ID: <1f0e47e2-67d1-4761-9a36-ddac062480f1@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:19:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: drop stray newline format specifier
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260319-drop_stray_n-v1-1-37fb619538bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-drop_stray_n-v1-1-37fb619538bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j19nKl_qrWrliC4-zrqxHclDQ_wmXUwE
X-Proofpoint-ORIG-GUID: j19nKl_qrWrliC4-zrqxHclDQ_wmXUwE
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bbcdb8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WhcIUqnqjzBuv6diJSIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MiBTYWx0ZWRfX+TmQ11ygY0tl
 fDEil4bCppIAOTqtryzbsODEOvimwPeirNBFuP6eQw35rZE8jMYCPvZkjyzix1ft9t+G7h2c7q4
 WE2B1fOxV0P25fNWWvn3lSqh/vHDAyQeGlyUxm5EoaZ+n3rEDEtlVUy6HNYQs6Xzsi1nLMLMg50
 7MG8AlM9mridiXy6j9KE5wqu0ZHRKo0k1DkxWrBJrM+dQXg8flonnEIrot3eSE3SQBGdMFLpEno
 7quoQSwXne/gRtmhR3dnF4UYrgUHbSUR2lsCyyjTaPAP5SOOzi+aN71hNQ2bDa+eOeADfOrXsEI
 CwWCadT/Sjf8YbqHCluakwPO4F9CCw76ICn6OxL19hZDvA/U9HAalQNGAHqY3IwKXyPHx2DLK/9
 cFtjJIcswUg4scXQUjpuOkttv9NXCHxTU39ijIqUaT3HbsusILgb+FCac3Nr016yM29FWdkYFkz
 0WkUcH04MmRYUjrO4Mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-98704-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC2F32C97F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 10:48 AM, Kathiravan Thirumoorthy wrote:
> Drop the newline character from the middle of the printk message.
> This avoids breaking the message into two lines unnecessarily.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


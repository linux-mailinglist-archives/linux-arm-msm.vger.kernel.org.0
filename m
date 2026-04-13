Return-Path: <linux-arm-msm+bounces-102895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPRkIMeq3GlfVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:35:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 794CD3E92E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 896A93001CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBEF34750E;
	Mon, 13 Apr 2026 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MB6+e3P0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZhTcGvgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB119C546
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069313; cv=none; b=LsTK6d48QlzGXpJiOIUi7ZUNg8b0Pb+PQgBkkxVpSnmNqRFYORVS7z/5WlaggJ5GIXlRBoY5jvbxRcg0f52z+XaSV6UtRR9NZ1w5OwqI2/7ST/PeuMC2o6I4s9fNwM2jKJLjYvvSQsDp+5SHZkMIrhvOTFI/6eWLVWIwOOI+Csw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069313; c=relaxed/simple;
	bh=j92UguIodWIzI0IgjmW8RFcnf4UpK4y2/QeoYa1D28c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCXsx0LKQ335ZhKrbPtc/FuMLDtW9NjumhMIXMPU4c2OmsHZNxz5EYkbrL7866HDPQAsuMH52S/EiwDxhoTt/ExScb38ICXDuH+YB8RP+aSOCHrYypKo3PmfF5AhqSnoutoojKaSwvsm06B0Wlk49FFd8sixxL/aJ5X76GXmvbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MB6+e3P0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZhTcGvgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7KaaT324824
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMMXIg5OLZAypIk9U8DkYAWlwWVjKkShTFXInguBE/0=; b=MB6+e3P0BP3/PDkr
	E1EGMY6oWBMky0Z5qfFMug3tqz6PnaE9MI/g/ok51xgR9MM5e7B0qqPQ0mNPjX7u
	BwJmsv/Ay96gpbxWJVxnE3f/vMTK4ekvY60OUmUrTmYsYPlD7/I1+s2iRSCBB0Uw
	zOBuNY8ot9blQFEnW4uQ7iSzcaDJDwAsS8/LSMA14Ch1+jZOaP4pfdYceVR/0lKT
	vFH4RsZtNxMOyp3oyGbWRN25axJKcR02dGUkoGSyFSZRZtSD2Ccm/eAIPXaxtrIE
	Un2J/iFmR6sjW2lM4Ppktuq6l6qjRWD1uSUchGs3ZH9gSrHPWs7gqNGizuuv+Bth
	kH9rIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mdy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:35:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d7128e038so10227061cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069310; x=1776674110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMMXIg5OLZAypIk9U8DkYAWlwWVjKkShTFXInguBE/0=;
        b=ZhTcGvgJ0cHqW2aQIW+BgxP76wJMyYC7pveHHTG+N9j5PhO+YwdSqk2AduNTJ9YtO5
         BZsn8lXNgXezvzP9y1tqcUPjaJ6JH0+WGNTit6JxL8lWyexizp3Z0NZcwm6ydU/PytOt
         V01LuR3XIWWAauo9yK3T29ksw0HhNCirEIRATVXJqUuaaTCiA54MacYDICYC8Q5jtO0Z
         jLRJVtgAYE71iSxpak10jT0HcoL+OH9hRR5zaZXIv5XmgRnjBy1F0GV+Lf9/9dU4XjIC
         TMZ3pkABru8Hemy0NKE2PK3ZB7oZ71oOP+/YGVbq0QxVsnuivz/u/06eTNHb5BFCwmYk
         BeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069310; x=1776674110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMMXIg5OLZAypIk9U8DkYAWlwWVjKkShTFXInguBE/0=;
        b=aNuftNBgePGjIuOuDBMlLHEeJvKGggicFKJgszqthDdyXC3Wl8OvKNl8D5Qfh9HakP
         /tvD5P/53yktM+saQ07hFty5SHRSOKb1wFXaVNooxjOAV58hSZFnpoSJZxTn1M1Q56OV
         Gq1/hDdFIYQ3gyX7KZaGMG2/INxN78VqnWdneabHtBPJl1c1Z+MmL1vPSgKNd4IEQ4K0
         uMeDzYCOhclyeib7fSU4Q3QA2QFXT9h9aqoEK4/lRKR6Csi7kqnlDOHkqroZx/yb19Ba
         uJSEIQ1JCIfpfN+Er515TupuDZuSJ5eFN8D959Kkhll/ymmqJhqbe/W47K1jNGbjcOEe
         SSuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cpZV+KP8Foxf8DonN7hgJ9rnFHojWNsiUgr0Ly4CtSR2PQMt4o+EXoOBtdwLqBYsC+adXr0JlDy7FU9/E@vger.kernel.org
X-Gm-Message-State: AOJu0YyggwMiAfG8c59C3UKCahCKQT/bAHkBoILfO3aeI9EcuVbggqqK
	JugOQhPPSelVlsixMg3OjhrjTKCLFGbGwBRNHkbR7moQ9xV5hriwFxjj06w6allDYeBR10uDU32
	giY+gZtE6E5Wjw/JFQsof/67GZxKpUp6AzEOR4Lx4SPjyhTHTPCdD3eihUe3pZiU7k7Zs
X-Gm-Gg: AeBDietItRRMbGio+Odoy403Cr0yKw+JGCeOMfqKSpg3hJXsZk21I6ssSj8xKJ0sTur
	kQyYO68wQDkq6uA58ka6Y2voZKNdMaQ85OQ9P+acf2Rj5fYJCoGRkwiaHffYcFZT0Mr7qoYNW/j
	aVVVUo9IobLihy1P96+mm7HnI/eYYU13VAlG4v2Ws+zdQkkORaWygdoVsr/+utZ+++mLaY9RSeF
	/zrkT2dF5YvSI4vgd/G7XdQVVhBzObeCJlXo8cOFGYxkwTM/V6JezSuJXwXnRxAjcIqwfUVZ4HM
	LFPf8uC4xD62rAMti2PThpAxJcTgAX9lKojhhYhNXAwYjhxIKAcPnAxZIwtx+uBYV7kJid1a8o+
	Zv5jX4JsmpHWdKJLh449GoPStZtLSpkoNqgCNw7dimhz83IWgdnw7TcJewmCH3i30Apem9yZvNZ
	9b+T0=
X-Received: by 2002:a05:622a:34f:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50dd5bf0dabmr134291141cf.4.1776069310188;
        Mon, 13 Apr 2026 01:35:10 -0700 (PDT)
X-Received: by 2002:a05:622a:34f:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50dd5bf0dabmr134290971cf.4.1776069309691;
        Mon, 13 Apr 2026 01:35:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de9b414sm300589866b.6.2026.04.13.01.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:35:08 -0700 (PDT)
Message-ID: <14ecf740-2db7-40bf-b647-1e2d7a3ce95d@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:35:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailmap: update email address for Taniya Das
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
References: <20260413-mailmap_update-v1-1-5758fd5b0647@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413-mailmap_update-v1-1-5758fd5b0647@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcaabf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=7YfXLusrAAAA:8 a=yC-0_ovQAAAA:8 a=VwQbUJbxAAAA:8 a=PSgcYXQzAAAA:8
 a=QyXUC8HyAAAA:8 a=Uf9hZInujwd928gMR7oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=SLz71HocmBbuEhFRYD3r:22 a=wWUH5_S2rmbbYoQN9rHo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX8O76SI0jeZRs
 6BsRvbduPlIJy94TclgtilNY8u2IcK9mSM+3zRNOk1b2DPJvdS+tl1OjZcN9pQixNPGFxdG3DYJ
 JmxRiPZTfNgjTLhz2Wjtbf07RVOPvTzsQrLAbhlTje3t50NlAe/clWZ+sXMpowOhYenFbCla+2D
 4Ygg1n6S0guy4NQ8CdUgPP5aWPFNjEBjI4ZVaLkIZW3zwvwDLzkJsWknGirG+6YwiSVF4Aa82lD
 pumc8aPWa1GEGR7xIQf7Rtb8vX/MN1Cdm/4c4oRCz5MOY8ov2Efdhmddbvl2ZaD1k+k29qXrTDQ
 VyZi+WQGFBV2Aaz0c9bFujksYEiCvyuq7tiT55Q24rOFsTc9kZPEcgWUnK9q/H53200CIfBjv6P
 HGJW2dFVxw24/XcQ/WpmT1aC4ZXCZFSDuuqU0ldVzYWgyMSR3JhsGxATPB1vJyyenE7lLOoe5F3
 sJ1o4ScuKL67+FiQCoA==
X-Proofpoint-ORIG-GUID: 12Y5lXxtizgkuZerC5-qRp4fngAChwt9
X-Proofpoint-GUID: 12Y5lXxtizgkuZerC5-qRp4fngAChwt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102895-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 794CD3E92E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 6:26 AM, Taniya Das wrote:
> Add the new OSS Qualcomm email address as the canonical address
> and retain the old quicinc.com and codeaurora.org addresses as
> historical aliases.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .mailmap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index a7202837c1f0f4afa52c2a057fb25530f5b30ac6..c53502b3f979bbbd3252fb5a60c8c9d9428b04d7 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -830,7 +830,7 @@ Szymon Wilczek <swilczek.lx@gmail.com> <szymonwilczek@gmx.com>
>  Takashi YOSHII <takashi.yoshii.zj@renesas.com>
>  Tamir Duberstein <tamird@kernel.org> <tamird@gmail.com>
>  Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> <tamizhr@codeaurora.org>
> -Taniya Das <quic_tdas@quicinc.com> <tdas@codeaurora.org>
> +Taniya Das <taniya.das@oss.qualcomm.com> <quic_tdas@quicinc.com> <tdas@codeaurora.org>

I believe you need to add one per line, e.g.:

Ben Widawsky <bwidawsk@kernel.org> <ben@bwidawsk.net>
Ben Widawsky <bwidawsk@kernel.org> <ben.widawsky@intel.com>
Ben Widawsky <bwidawsk@kernel.org> <benjamin.widawsky@intel.com>

Konrad


Return-Path: <linux-arm-msm+bounces-96626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHpxDmoHsGnNegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:58:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903F24BF03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6FA13091F59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4308E389456;
	Tue, 10 Mar 2026 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1MC0u+o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifLTo50L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337C36D9F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143075; cv=none; b=n/8NybTC951OXdgoPkq0bt4aCrOXohPGFXYdmWAGAhdCM1tva74n80A1JQ6BwfxPQ2nwH2LChz6C+SU8YoZOn4Jmne7GvyZ3TSil/ZoC4WX+Fdy7Eg0xPOjUk1QDXnyeZrpSlNY35bdfbbL6GIfv7D1XQzdVwIMv1JYU183c4FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143075; c=relaxed/simple;
	bh=lBw5t27jHEg1Vj3u9vFmZOsS1L5o75PiXJs5ZFvWFIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPw/u/STbWZ66tRVTnVlZ1jDLlEy8zC+p6PUe14DDUItdyFWeORbH+thkeCa7LOr2i6qUlqbBSObl7/UQemI6CAFFDfwziWPAr5IFJMpbSq8Hl0Ux1wCLz+Swhj8IMs54Q7ybb3FHlk8P7xbk+gKgS1cSDvrTZ8bpVPv+isbwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1MC0u+o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifLTo50L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AB34UM568773
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXvuII2zuA9ukukH9wM2MdKQZwHESE67XMzLBT1P2cQ=; b=f1MC0u+oZU7md0vv
	QjClhn8rb/OICh1zSZmQ3Vqco7tu1agGFRifJ5vvojmihN8Vz5KlOeQ4tEhebXEz
	dtwLKpOBIXy+wsdycbl33jkLdvSBrzMESMAsc/WtdWEtUi8mP2VHTeNmmE9O7Wt6
	ALB7dStC+zhz7DgwvoiJJlKCJArjVlbo0akDs8ZgwTcLP3yVhSz72KBO9HXLCem3
	bxjrSUMG3JA7FE4rCx87CGm9RsX1s5gdJSmV9SxT3Z+V/7cZw9qzl+ti8wgSq50M
	7WgiMljgE+QEK6RNMwJ/DVeUrR6MVcZ7eag2Tm4nv15q/7wh3gPAmFx+Uwm7Xmrn
	cFpibQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8ha3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:44:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd97debc51so29668885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773143072; x=1773747872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXvuII2zuA9ukukH9wM2MdKQZwHESE67XMzLBT1P2cQ=;
        b=ifLTo50LgLo9WeNHRcc0sTshM0+niz6LKqrgUB3FzC/pew7jT8D0SSv68MeBg/efuX
         GuyiB13nx2U4Ss3d2nVeSByCUdhuXNjt1B96RIyd0naBbrvHjAzBsAOd2eo7ybP+mRE8
         fSwQqVXiKnD4yzbV+R1lmxj6JhlR+Cpj80vx/Dh/o0W/5cFa05HXNHH+YB3Dm/Kxp5vv
         K/YcKEIl52RgqqhtYw6zQ5rMINO9b2+5oKjuaG0RriUkvGZHICRZo6RQeLcyIYlhwjQ6
         u8K5JA/Jmxwv4m/Kav9VV/eTXe/OZFu2bbOUhDiuxdOdqtXIReqPNAelJBsMyIBlLUtH
         2KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143072; x=1773747872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXvuII2zuA9ukukH9wM2MdKQZwHESE67XMzLBT1P2cQ=;
        b=QQY4f59kPlreWzI7RSgEKuZS8CJxWzGFVeeNa80VF+YCf16bb89+CYkC8yvzczH+FI
         cCGt+FI+N7w+lgF2Mac/HZPRWigDFo8vT+wAtDcYldIQhST4CitMnqSV8TSFnB7twTgm
         x4WXNUwL56/DeeifOETky+j7EnEreUDm7RXk/2RFQCwN9oGmNpH59DbUQ8JxcNCX7fhh
         5D1bMth7rSxxqh1C6bzW2qupkMjmb4gI+04ZCzO6VGisxRQDrQTejzv7R424+TWW369Z
         qHxSt/nrAxmRgzcFVVExYTK1fkwspVSci8Aw9u8/dmwRz2RQnNBGc5uU3ngZrjE9ygWx
         GTJA==
X-Forwarded-Encrypted: i=1; AJvYcCWLh00YIp3KLDSVG5itKKczcgStgsCd/p5Djp2UT0E8H48ChNxgKQodadqaRKJEqOYv3KAInR3EUr81Juhl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsv5qM/moB2HojyBa6twWA4B35IwAM6L6v725GUGSQbR/tmvdP
	piE2aY3jFExcsrJJWDRWVUragFDLzHSHCjY9FgyNd1NZCJ76fJSNTwbh3tZmzUduivjouXZ9hPt
	qdIgd/7sJW0M2WUy1nwvkYrhN7JNJJVhrmz8g/lOloasplRJEjFNUWYvBLW8ZdPKkZkHF
X-Gm-Gg: ATEYQzwNNJMX5/9qjLiD2KSE9V0pxd3praiF/5vRtG4AYETRz3q67+6GjhyX5/qpdqu
	Q0kYSdbqFFa8dx5jp2WgxVsktGWEzMWNN3CEz8j9DF7MkJEqR0mIyZETjOJXsTu5euAqgqweEBY
	2JZlkbsL4EkLmR1DxL/Aza5hoZ/LYRVOf7Lm8WqouBQ+vVrfJx2nYAqNgnDUXCANVaX7W2+1C+O
	Z3j7oU3fvRZQpCni9j5VbRH7WbBPOBXWQySn0dFid0X23UeeqcspRuMR6BgKojaRt5m+sTwpmpH
	2RVh1x26mMyWj3hwx1pQgdVVtDQ7VKcFz4JMo/zyWwgxJNkLNvzbmntBjzFGJpPu/iLcYmsAuFI
	2+NvzMURsQB9QyOGNBxXbHKKYCYEtqF9jTyqcWNHktCyajwH4wno+vXK2cqlavJ/jsjsTgWPwcL
	Xa0o4=
X-Received: by 2002:a05:620a:7016:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cd6d4444f8mr1349743685a.6.1773143072384;
        Tue, 10 Mar 2026 04:44:32 -0700 (PDT)
X-Received: by 2002:a05:620a:7016:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cd6d4444f8mr1349740485a.6.1773143071854;
        Tue, 10 Mar 2026 04:44:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b116sm474033866b.23.2026.03.10.04.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:44:30 -0700 (PDT)
Message-ID: <8eed4bbb-6d3e-4ab0-a6ae-7ab2d62d3264@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:44:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] clk: qcom: gcc-sc8180x: Add missing GDSCs
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-3-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010214.224621-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMSBTYWx0ZWRfX8vHouvG0Dlvw
 gDYaZl2NaQQK8XIyu++wyluNYAExMFYZyOoHL9TSgemKh6MzJzkCn354QRhIj7+pOhfXEpiO9AW
 6sO4/x6+6uBGT7RQRnN0YKIDpsxv9elnZIncPXWL5NPuWOtSX9JZeP/+byf5nhKX2gF37+0y8RD
 dt/VFYqiTYVsva0vlldxVPNfWzkeJ5zfsxVWDRpeR4kJSkXBlIP7SZvp++qRYYT7rhs9RA8I9Ct
 speh19CMwAkHyxCn/BrmzE82EIH67IAPHwZRvOsoo60r7FGoJCtv9qboU/wcoJG3qt3XJiYuzb1
 wsub1F6ZPxmBiINjRBsQT1MEWQ/3MBL6u+PAexzjldvx2JMN2PLyFlBkz1mvN9q2kwt0Cchgsps
 40Vo9kyM9X4hiQn33pBqjft7/+mk3TUAYWA9OoMLiwyEzqGxtywiMqF3n6r963k+n+2sRCHsPM6
 0W2UgbPeNy8ulSv+1CQ==
X-Proofpoint-ORIG-GUID: 07rpnetMr7KgqGIoHaiiYXiGUvAubuhs
X-Proofpoint-GUID: 07rpnetMr7KgqGIoHaiiYXiGUvAubuhs
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b00420 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1SaQbFAW26ibWaWi50sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100101
X-Rspamd-Queue-Id: 3903F24BF03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96626-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,packett.cool:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 2:00 AM, Val Packett wrote:
> There are 5 more GDSCs that we were ignoring and not putting to sleep,
> which are listed in downstream DTS. Add them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


Return-Path: <linux-arm-msm+bounces-93093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPTFJMs0lGlAAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:28:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C14A414A61D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 659D53004415
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B183090CD;
	Tue, 17 Feb 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bj+5yXt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqXlYD/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F88308F23
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320519; cv=none; b=l3v6771f8qwhDp2+CVK9bmy0NNZFMbRtnF8RlFX7bYpgwVJ5I5vbfsv0YiOQa3vKmxDRBZbk3dmBxxbgkKKKHJAh8kyW8R4/5/SepIyNwaRr+5JipN3bTa+NUnGccANI/itlzDG1iS6S2yrnX7ecqC/EeXYBzYnGAgdZWWU/PEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320519; c=relaxed/simple;
	bh=pTfP5b+2Mi4mY0WGBgKBG7z/S2+qq8yi0Xdwud5vszg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ID2860r7591GoCh+cPjWmMcLn0jK8mgatmD45JihatcgRzlY20qRThmDnV3lF+ZY7+k3029eMOi1ryNpczq0xL5sY+9iVsVYFnC4Jg9guxrRhG2DH+RPKnTF7fA8+Z9hzUe36DkWiEB/I/Pqrc4pWo4cDSE/qU84PzQ+AlNiQYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bj+5yXt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqXlYD/K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7khG910705
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hD5B3RHvIT1cskPThbNNJ0AFJPZPfutqv2uU03n6d+g=; b=Bj+5yXt+gPv272Ue
	5U9ZU/lAkN20toSqlt0vhZdmVhlla1motFRGQMqV13lwcoazT7FeVALHswMXRe4F
	UIg14rpUov98fsgJRSG848ttWzcDuLtLdG4RJEo6NsLViIH5W3h1jgmbTNt+F7Yl
	sfSDFF1EXtdVXi2H+8nDbvgD/IGpFgzyO8nVvg3m7OTuM6T1FjQNNhiJ8FaFB6Sk
	vKfp3NXg8Ly2WV6izPIfM5mlHAt23HCmDIeV1Gq5oIr1SgM2LKYPBmst6+n6A8QU
	gLXZCMNwvq10DpBfxx9traeucNogE67+7UkACtXTit7RmU/GMcKBfqSD/mlZ1Ybj
	nWP4EQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9st8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:28:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-505e8451617so34936341cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320517; x=1771925317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hD5B3RHvIT1cskPThbNNJ0AFJPZPfutqv2uU03n6d+g=;
        b=iqXlYD/KRf2pCrWTupl+w7mPRWGkuYJgXbO6wgalB60syFADlPy8Yqt/5Rkae10atf
         xrjKVhzErV+TsMyBwnd7MU/MkL61uqQQ4z0Va2sTrO/bEeBfFUjYYT+vT6oHluMVxFix
         ZxEkRG+bxgPZsKGwHto1MiFIHqWaEZSURZD+ESosyEj/UWQYJ50eKs4SDjy9RQjG1j4r
         sk15Qw6RuYQYsuOAiRHqGMZeH8iwnH5ICZWMhCbuCyv25YNu+q9QRhmawklhsvjiHnTH
         Sd03KS47AqTuzNmNvX+uHVIfJr3md+8FVWuqRterSsjIcejHTKxHso2uKZHHvbrRPVii
         9Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320517; x=1771925317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hD5B3RHvIT1cskPThbNNJ0AFJPZPfutqv2uU03n6d+g=;
        b=D2X7sI1pAcdIGv7GvJ4n0UuqMsgbmwb77PnJDsr1URG2yLmSW4zFhs7bcFL1c9JWB8
         5imAGm0WDQF0V2Ws2MyEjUq8ZTq7WSMCA9+EiGiAfCj0aI+e1iMYE6n20trDbM0r6pE7
         TZahMzCv5hgzuZY2LHXbxSPhHKlnXi7MJRPgDpBRMPV/VCOuH9C7G2EZaRJtT92Pcwjy
         6kpkhk+WrW7E3y/bmlETkz2FnWraqU63iKIkrylPQUWyJxnqqERon5Ekhh94JWE9gsg6
         /RnSmJRx2aTNaRBDi2c5W1/rYj5jvAl5MzdgsOg0tsPkoF5Q6+2i+x84fEuhzx7UZNRi
         tiHg==
X-Gm-Message-State: AOJu0YwRCxkx2xmkdGEi2MJPxi7NdlC/QnTxlwA7TjSywyUZbKV+gnfV
	YKWQCZ99u4tP1hOKrARW0JsaxaXDHG7yPxXhgOFo45mFqrrLlm6jhv7Esp8dVF/ymVRo5kceMEs
	dbmRfhy2UMw5t9CK5v9a7dANQMjMp9d/QTQLLB3Zc5EXcVyWgdMrRuiqpNHWWf5rf3QRB
X-Gm-Gg: AZuq6aLLwk6R4H7C8Ouce1Fcu5E3CUWiymHTQAqY2W/Lz29cF0ELO/hyBqKVthLKUgC
	AhBG1ezvst3aZkM80PM7wT82VOuD7xDG2nw9x67eFkW2gMEWDq+wbd4NvrPZcFdg8iJjnvlKxIf
	IyWPJIXXV/cd2TtUHx0ogbJb0R66Vsy3pXiR2FmeMSkt0UhSGsn/B9nTGjIrr5sIuLJeiSOQ++4
	5L/7zzpY7ukKAbHaEYAFOMurLdeBUR7uri2UO6vsO9RNhgbaysCtsPPUNFlUoNayRz2eWeKh3XP
	C1XXZ8eIcSuSx1V5aYcROxZzhjofss4h4LjDXbOXGQwe3N1pTGDcXfAmRW6vYlTNiUVvmDKWxt6
	u7/WJPNxNsYFL89Ws36SGwntMjBcTCM5au480nSErsXWi4tWZQp6tT6u5Qr51otgQUd2nbIAm4N
	deKhc=
X-Received: by 2002:a05:622a:728a:b0:506:bfa3:55c8 with SMTP id d75a77b69052e-506bfa37aeemr70611731cf.5.1771320516670;
        Tue, 17 Feb 2026 01:28:36 -0800 (PST)
X-Received: by 2002:a05:622a:728a:b0:506:bfa3:55c8 with SMTP id d75a77b69052e-506bfa37aeemr70611611cf.5.1771320516286;
        Tue, 17 Feb 2026 01:28:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f1388sm2337658a12.28.2026.02.17.01.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:28:35 -0800 (PST)
Message-ID: <da9aba75-f52a-422a-9899-6581ee9b8b7a@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:28:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
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
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
 <20260217-eliza-clocks-v4-4-5d09f28d4251@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-4-5d09f28d4251@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfXw/XfaCTWbQKZ
 wU3P4lOL5ZTnXGdJhlrD7jkov+ZneNRTpkH4oFfo6PgXE0ddIit3s7HQCu5ObHjKB4fbdMyuPud
 ygzmQ2YDEhMC4nr7nvhhAcvFhJAQlh5Zkzj8i/rxFMAerJ+zg0kgO3OKNxqGfMjPVSLrDEJsk4h
 6XF3Vfn7zU4qmOqJ9fSI8ZF9cpG1iHqGxXzOHT/E8aLSVAP4uN6N+cPKN4OLxknaLFXY0Kt7koi
 lMIbAB3NJHej311vRAcPP4FsdTs4jpu0qB8wvFasLmUIz7IfkjVdz6BV5QYx4rJnJkSQqsh3dSQ
 TPlwIaZBi8DB/0DPjJsUZLYZBWuZci5IgSu9sZXIv/wAojr6ykmZuhKYV75H2SbBNfFYphaQL/y
 0aNB50K4lbLqbWgvBp6MpMmcmSb89cNu6WNYrSxts/dUPUgQfJknEjuaZ+Wo+uJaCGJWNf1FIZi
 KJ7sIfBMj2EreTFWV/w==
X-Proofpoint-GUID: A0Z236-QwKk2GQt_tNUl9cwwktpHu_jH
X-Proofpoint-ORIG-GUID: A0Z236-QwKk2GQt_tNUl9cwwktpHu_jH
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=699434c5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=QfZBNxv062MJluzyly8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93093-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C14A414A61D
X-Rspamd-Action: no action

On 2/17/26 8:52 AM, Abel Vesa wrote:
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


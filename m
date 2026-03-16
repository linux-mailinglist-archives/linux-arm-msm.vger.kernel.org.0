Return-Path: <linux-arm-msm+bounces-97875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AvKEfjMt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:27:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8D1296F61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 428B13040746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C6E38758C;
	Mon, 16 Mar 2026 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhmjbIMe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WiJ2bWih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA02238756E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653094; cv=none; b=eOw0hUXXOcto9dDzx5IyU7f+M0dYbf4zLi71wK/2AYrK6m1SJR46nK2PJgRjBNxohiVWY8XESfk27U8lFotm78tWq1+UY/E1ehg1DKMn+WHsHYHhltfFdaVIPCA8+9Ofy0tWFH5cFm1ercWhioJ5I1ijitKBHGbr8iZCaqqlcco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653094; c=relaxed/simple;
	bh=1ibb+nEbb1xz2aC1oBbHfNfmXMBwzeSAnRdufKPwCoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmmBaVFikFJZ5il9JyFlyRoRI6jlRS31b9NR0X2rssgkGYhH4uM01QhIXoW0AtSKbJksKSR+/o+wV2ebwjhIhLpFQbL+dk9Udzkv0CQch6ktqAmhwYMxcTFFYtUMwWHC2GMqrKEIxf3q6dUn3G5A+E8bdJrNNOuKxFsL51IwY54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhmjbIMe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WiJ2bWih; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G65BvG1068188
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqnHphz3AcCsBNhfpt8mS/t37hEOGNsYFtyFVWGP0uk=; b=YhmjbIMeMC+/1C94
	wWAjxYcNwsG5OaDE8Xr1kvV39gBgxWk9p1z15xGfl0qhWPLysn6ulotI8oRIu47E
	wfRC1ZpNa2H186hDPF0ktqCIqzwA6YIgCAGibRwvYpPVR5aj1SvIz9JmnCwcljhE
	6N7UBgFoSeq2h/oo4j7vJrytc6t8JpH0x6qeDdLrZLK1hUaaguQYg6Cg9BLdJgVc
	eCs8w/f7KXC+sqHCrIjiugDScpCRQZwg6tv2xABdViYYSAPLzzaQG8Kke7u07MfX
	2x1O2tHDtS4tCWraU553KWL55HsX2PNDDlxXodL2uIAqWq6zrpCGNJCAAMCxGK2K
	6cqEng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027d212-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:24:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c49436edeso10855256d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653091; x=1774257891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqnHphz3AcCsBNhfpt8mS/t37hEOGNsYFtyFVWGP0uk=;
        b=WiJ2bWihId9Eoq29riUQTPu/oVsyHA9B+lZkiTSXXhcvlQ0PIJ3rqv9ozgewoWZlNE
         Azk3pw4BrOWCDuL9ytt1zyVIoTcvDe8WJFZO2qvdQneOQP5ldF0Ubt1kaHlOEvyoHE6q
         QjRP1973aFhFcA7i+0sjlp6ToZ/XSfw6XkJAVycmOEuMJkjS0dX+SQY6vkVJmew/Ri8y
         JZFGoe19f5UgsIiDHzP32b+7jXZNnpCROaYXAlpzExaqqIz3exbMyAHneYxECMxiF702
         rtRbTm5MounBZtZTOGWVo4hgj4FCtCsOVvCspCwyKddS8Mptw1Z2mZ+MGs/yys0cSE/u
         oVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653091; x=1774257891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqnHphz3AcCsBNhfpt8mS/t37hEOGNsYFtyFVWGP0uk=;
        b=mHs9orGa5t1FJJqOtP6Nq+zUJ8meNsdfmQLCpBCna1cHGtPris0OR9t4PIQJM/kftm
         FivJht9aY8IpFgqMjntqsa/jYyLNAFFPC6Gjij0ZNjirACBsNUJsq35vdqcG7Hce0hkY
         RPg4LziDi3j3rg/PeFI7f6pfIvjEpR+Cjou0zkOUI94SroWqOm3KQEInn/2sz4esEfBZ
         morzKHr/08HKzFj92M1bEbIR9fRmdar2uLSMRQflFTsQx+/Nyq3eiQne0mP1cM3LyrI/
         eOC1BjxZetDaBEDthwf4xgdVVDlg3CyKi4WDJ3db2LX4/A9KzCPlNErOBkEh5XneHkkq
         HplQ==
X-Forwarded-Encrypted: i=1; AJvYcCX09t477v5MGzRcKwfkLICT3LNwrOyJfHF5BUVIU4I0ILomwt6oC5tHN8ZtFqdOi7A++/RLaUmHB3Sgye+p@vger.kernel.org
X-Gm-Message-State: AOJu0YwhlJjPHiLY2shh0KDFGljAYzf/Uu7UtVCIOoLRwnuTsYc8BTy/
	kX8azVBZrJzcQKYKQrrWEUG/yE3vsxy8fwndSp7iWiHjcCmt2ovV75wr0nDCiuP4+RdE4l2WKzo
	frlh/yXA7opPQdClA9UN42cGjYnrBQUfHFtOxOBi1pRaGikVmO7lrNgddHowQBynvYN23JT2vnt
	YH
X-Gm-Gg: ATEYQzwdnUQfbwDH5imZKBwN69+QiIx589b4qH9b7UcRsvIlhlBGwCl5d0QggDJz4uO
	CGMlAw5Ncwkl8/NtWj+4UGB9CNjK77Zds18oHLGmJTpo9EKBLWEB33gH5FRhzG6B3TBodBqMd/L
	qn/G+zj69eL7Qz24uexPnlSdbDZF5Jloe2M1arZoy/Vm8kcjWi6uAHVoMQn5VCava+1JH4xsjkw
	n8anuJZYiksagb1IVyJW9sz83adfqtenVzHM/f1oBjEcfTFJJ7MZRvx5PoRDJ8NZJlG8gYpfmFU
	OovD85Fivs6MTwEVhGhsJvsLgIADFIR34Ms49em/sXYv0KvdFh9oBwI8XD9lh/+5sSxunem8wUJ
	YrskT8DPmD8Deot/oK/qFg4mcXTKHrq/dgNzqUtbzSjLOQhgHrhiklpORD0pxl6BOs04BBSj6QX
	iwOFk=
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr121492606d6.2.1773653091098;
        Mon, 16 Mar 2026 02:24:51 -0700 (PDT)
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr121492276d6.2.1773653090652;
        Mon, 16 Mar 2026 02:24:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm528302166b.58.2026.03.16.02.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:24:49 -0700 (PDT)
Message-ID: <7b44e540-6ab1-4f41-a878-08f50fa9a5af@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:24:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] clk: qcom: camcc-sc8180x: Add missing HW_CTRL
 GDSC flag
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-11-val@packett.cool>
 <36da7262-0dda-4bb1-b9f2-abd77ef83730@oss.qualcomm.com>
 <31c68360-97a6-4e23-9d5f-f141abf0790c@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <31c68360-97a6-4e23-9d5f-f141abf0790c@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JTKSH-R-pp05AfG0hgRWAaTk0Gjwv_5n
X-Proofpoint-ORIG-GUID: JTKSH-R-pp05AfG0hgRWAaTk0Gjwv_5n
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b7cc63 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=wZf2C7TumtqOn80vQZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MSBTYWx0ZWRfX2XlV+8RD2QEn
 s+P5reTIfm5O/apJCj4cTUEIuCw6A5ZPMbZIxB+epv3XZWdjAs3T7JVeK+0rnE8oiXJLxhjUKkH
 /h9BC0ATzBzZ8QetyXx+lPI9LtAdDeeK192RDNLKp6nhK5YRuTb/g5n7aEdAuzkaKhvdkvj1wrB
 6spfyVoTM0zpHAxykkK4pl/qG9h8aVT7yDnTzk26qioR8E1mkhXpAg4LxzlxDgUTCljuS+Od6eO
 sDam5AX6E6U1sCMn04rPD/DXecHL1bHi0bBGLY4J5PrGVWcLcAUQ4t9Ay3pt524khqVNItEpT/T
 H+fcndSkYV96vaPvCD6pApliIaj8CgLXUxHM6/clopxQvIuOELY9AUyOsge5pmDCmDeuKvXRXFc
 gw9YUChVyWZFUA4QSoyNeN9Kdxm3w683VdLxNSCHkhQkXcVM7uMqS6P6mDfNrFAYj6vT6GYyXkS
 bB//vO+Fol2jM/u/E+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97875-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC8D1296F61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 1:13 AM, Val Packett wrote:
> 
> On 3/13/26 7:53 AM, Konrad Dybcio wrote:
>> On 3/12/26 12:12 PM, Val Packett wrote:
>>> In all other Qualcomm SoC camcc drivers, the BPS and IPE GDSCs use the
>>> HW_CTRL flag, but it was missing on SC8180X.
>>>
>>> Fix by setting it on all applicable GDSC entries.
>>>
>>> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
>>> Signed-off-by: Val Packett <val@packett.cool>
>>> ---
>>>   drivers/clk/qcom/camcc-sc8180x.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
>>> index cd4c40a81c28..67b2055bd212 100644
>>> --- a/drivers/clk/qcom/camcc-sc8180x.c
>>> +++ b/drivers/clk/qcom/camcc-sc8180x.c
>>> @@ -2555,7 +2555,7 @@ static struct gdsc bps_gdsc = {
>>>       },
>>>       .pwrsts = PWRSTS_OFF_ON,
>>>       .parent = &titan_top_gdsc.pd,
>>> -    .flags = POLL_CFG_GDSCR,
>>> +    .flags = HW_CTRL | POLL_CFG_GDSCR,
>> FWIW downstream seems to use HW_MODE at runtime and SW_MODE+collapse on
>> suspend for both BPS and IPE, so perhaps HW_CTRL_TRIGGER (and a patch to
>> the driver) would be better suited
> 
> Hmm what exactly would that "patch to the driver" be? Not sure I understood that part…

There's now a dev_pm_genpd_set_hwmode() that on GDSCs translates to
toggling the HW_CTRL bit in the register at runtime

Konrad


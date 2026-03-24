Return-Path: <linux-arm-msm+bounces-99675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDWRHwCRwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC103095DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B8E31BEB87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78113F165F;
	Tue, 24 Mar 2026 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoLVi22y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ox39SNM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB03F8E14
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357980; cv=none; b=cqIwvbmEhdvopUNqXIQMVvUp49LvKSen5rv3V/MeUVZ19JrZgVTSO7YiPodZBL/hr4OEvS7Hn+tb8hjrSfd+yBXxvglkhRC4Bq+qzjDUA91Hhnbq0jp4lvnU3YhTsVyIixXe7sqLqyEkas6EnnQ4YpLPUxU3KxQgoY0kLzNqxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357980; c=relaxed/simple;
	bh=Wv1ee/UdWUibTfcvsLtCfhOHsnrgoqjmx5DCdPOFXKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqJY7Z2oTaUTr5CMeBgVestaelXy7Mz73NsKajuYfTPCbXtPCn4yto28oWbyBZ+DFsK2YMCwN3zhTZW1k9nZjuecMHB4k2oH5Etr2KEl/wCikOIuRZf5R48VVGR1vem7f6IWbIKJKi8bQU2VVQtyYTQDUaXmPnhogSHzPQWHwVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoLVi22y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ox39SNM+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O97OMP3934989
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=; b=DoLVi22y7xyAaNOw
	VEmC4YgWZ89U2jWU1jstWFgp6t+dgKIcVRoJ4uww5UbsdiW/Utoxug0gnJfLD5VM
	tJ/YQ9pFIxhUkxL+8TdYY9CfFja4Jw/+FR+cJFb8iZfowegTD9vx9vMIKWWtxQ8l
	9ddkGjs0H8kEfgwl2WRynWTYFrGfmTL/0sCzFTkc2fT0yDmoGK3YGHz6a4Hqusqa
	x6mAFtwbm6J0D7hE2vr334yJWwuRGhmW4BhMVuQIOgTbJWD6+/5vo14CHzWdVqbQ
	J+xU3hsFWu0OlUIcURP52BuUGt0h8wo+FMO2GFBYFN4rJTecB/tEXfpGMW+yAY14
	dp5PDA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0mjgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:12:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ac053469dso598925241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774357978; x=1774962778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=;
        b=Ox39SNM+hFeGXWLXk/Zcln0kJrxOxiwm5scjQ/HnPE6SxIrnOBwbxyD0kdD9ArNsR4
         nr0/9wZefdQzxsqWH5Rc90WgxcDZ5huTdrv7u8m0kpa9FDL6c64ocigLCMA7X/DQ70Bk
         sboCdulcaqcgMaIzcjZxAA2KF/q+pOXS0MsayeApbGwCwABrTKSF6BZ0EHX73F5wnARu
         DdHE6WUAV5RDP2KFKQowy4ynQHRofXm/OMdtQ4fOZgBhVx744BEM8wdLod+3a2/5K0fR
         AZLCHDoCRnVwoQ+4QMqd60RGSweH0YRcEBICj4FqULnnozoPqzecg1IsfMGwb7YgPLGp
         Ydbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357978; x=1774962778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=;
        b=Tw6XKcpOb/OeHK+Bmk2DolfL2Zan4XieKheyAjkvtWnT/MwH2o0CW38ag02qkU+oaW
         zOlruwHRJl8MuS4Nz2dG0gmiZtX/SjfOt96N9/piJYbMAIpV+igjoJvw7Yh1T8PvkwvO
         aBt9RrxJuUPv1ljKE89/x6+uofdbGc3mxDosRUs+ULJr4mLTBWMeM+rHQxRjH7gY5i2a
         rnrLjGMcK/c6+fWFCkeIqCKigQk29t8fBc6csN4kH365T9PcR8DbtUdCt7iwFclWR4jF
         RbLYTMdV4qGIxzO9opxp641Tm7/3irJR3GFOJlP4O4XS9kdXt7e/cB/+6I0AOOF4LPN7
         Xfdg==
X-Forwarded-Encrypted: i=1; AJvYcCWVZRxGzyGi1qTDbgUGkyivIzuGtEd/L3QYo+7vCm8Mu5KNLwaWP/cl+iJuT539N1nNFtJJWdrWO6ukd061@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZ7A5iqVimrwNDjjXu7FDvRt9sM0EIpR1PB/jaru9UcCSc/dR
	jIV3Wj+3nfOU6utAeWvPhg9yhET/CGYtL5Fcnqn5Ob36drz5PrbnbMNSxuMyC9oFjqxJfi88zU8
	UgvBfuYJRDdKYXsVBq7t55c5ay8nzx2WcVZwd15XvXTx6HWStKH0RUKaOnODkuTwIxLUu
X-Gm-Gg: ATEYQzy7IhC49K5PmF4ruVduMiXm01/7dhCyoWMKXqacdOuF5dMab5NF1+OqzaUGsYD
	ybvaF2n0zgjjtfadq/JgSIxP3jfLk4vSPLjWsFBhJyQO17qWH+DVTDJGpjzYHOnWIKGwXX47Qnq
	SN6sYRwoWAOo7mn48B1cdLcn7FmMEYIwQiSCmvstUPzJlaG6705dbQNiOp+GkbbpmA4t+f1Q4he
	flRAEAVPDyXVaZ8sXIhseJTQTaMHy+zRHc22RIpVyxHdATXdxp7l3QbHZhw0axFOhIV7Q1R9lPI
	SXfIyGPPNrr0vLZSot/xJ/j/wnJ31yWo9wHWyoF6PkNbKAkT1UhpRoSFUyYavVN6grJDnNGyb9v
	gJlYHL4Hcz67N16xGAywbgz3FjWpaJlPV2OQmPLi+UzbT0T9IrodxfHABctVw/K2jShK8q1JQib
	JOO8E=
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr1187701e0c.2.1774357977688;
        Tue, 24 Mar 2026 06:12:57 -0700 (PDT)
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr1187686e0c.2.1774357977277;
        Tue, 24 Mar 2026 06:12:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c177sm638398266b.15.2026.03.24.06.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:12:55 -0700 (PDT)
Message-ID: <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:12:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c28dda cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IHWTUvJBEwR_a5bXKskA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX3pNbL9QO71zZ
 +052P3b6LzGyV/gjX3eJTr2XVxUoZ41/MW34+BVfvtOEEggw/kSCjvDoJXeS4tKGGXxSIdNwyvl
 82KKe3OBM/piHpCKT15RrmSGp/yiw1SRaAuu9lvSAwI6rSoBY3llIzCDlo0ZJT0Bjxq7NXvqddz
 RUIynZOKJJh/TgP+/Y/m0sJwMMjKhw3Xl/eWQPkP5iVlBYZkWsdJ1Y6Iftakri6qtryIiJTroj7
 4E97q9XOwgV1zuYdiJrozK7al7xvBSizNNNqKKB4fnzjCFUxdLuw7iLIcYlBY+MVEdNHiDzeT+i
 FddpLmHKU2O4Qq9Xrid4p/7ti77R7LtrEN1v+e7nJmVnCgCxywngfXs6MIqYLYOFRsOkPitFNeQ
 eAb266Z2Q4NTlEhoQ3MtTj5Qnoz7wbbDDa1iWpWGJZK01UlRNuF2tCps63QH5qyqq7Pj/cQRtQ6
 IFtgKrUr7bS9qhtVeHw==
X-Proofpoint-GUID: LdzQZarTK9tsYbZEIaPIcx5gWeQhp4GI
X-Proofpoint-ORIG-GUID: LdzQZarTK9tsYbZEIaPIcx5gWeQhp4GI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-99675-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,ixit.cz:email];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCC103095DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Definition of the NFC.

"meh" commit message

[...]

> +	nfc_enable_default: nfc-enable-default-state {
> +		pins = "gpio12", "gpio62";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;

Are you sure about pulling up an active-high pin?

FWIW TLMM subnodes are best sorted by pin index (although the file
currently doesn't really do that) as per dts coding style

Konrad


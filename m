Return-Path: <linux-arm-msm+bounces-97470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA1QNgMEtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:33:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0872830B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D98A73070B0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4AF2F4A14;
	Fri, 13 Mar 2026 12:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkZ0MYVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7bbJvKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5F145A1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405037; cv=none; b=Sn9PRj0V/4VzzK0gfXA2BFQxh3ZkQxZMvW5S4GVl7WduYBRtl42r/Sb3RFVZOjk/X2FuAngchH57eGwhdM2BobNs0T7wWdMvALAML1r3Qohtg+3GCtohG6CeQOTN15ONFQZykNpWkTJpyktfaFq49qeGrsuIC/eUFHdf3NOCR+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405037; c=relaxed/simple;
	bh=wUYaao9N554DKjtnrft29y8GPGyASDsSgMMgoiGJFHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGEm4F0PjPMmvPryXAAiPjs9jKENy79SF7i9gf5Vy3ujiCbyjpQEhulrXH+7LaSV/lBCcu1dmakqlc9wMNeYfMkGxpUln3hYC/DBBGX6tv2nLeGBoyVWMQt66BJK4akkI4p42q4m27yBbGMiHlzx87aV/o73rkJiKrXaDj5IfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkZ0MYVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7bbJvKz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBnpE13229734
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3GFh0qpkwl9z7+vFu6yN13UEs6c8A9nSty3yTW7bzI=; b=dkZ0MYVE1XaZIF4W
	kX/eAhUvYvHQJn35HFqzHhOV+U7YpJkR6CW0E0SIhpGQs8+9cvJXYUec3ZWk08sT
	hmBpTDjNzhu6jwK6zDiHmSnbpfwMCP/ozvcUR6XqGWF+lZUhyD9H0iQCtU8iRw0e
	yECg9elPsfD7Wac49obwZebosEyK5xKN4hD9irp0I6U2yg+nMSKkhFWx99QDwbaH
	jAlVnNuSd4JhY8B2yjRaachK8+L6XemS5TK5K2ouxG7VTE9jN7YISEXrl0lKeJJg
	WD8N/jdTNtGQj+En6uH63tZ3t9ax3yl/A1hcFoOHKtndRWSl21C9NHhEtBwwCaoL
	4brd5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7j48p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:30:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so130624585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405034; x=1774009834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3GFh0qpkwl9z7+vFu6yN13UEs6c8A9nSty3yTW7bzI=;
        b=g7bbJvKzlw+nji6DGTK9ia6fnrywMirP/G/Cz0nCUBq3fLlb8MvL1fW7/pu6tZ6uWE
         VOi8QqNbZjlx8jJ22q03L6VOuUCu6M0wAIzJzaMAo/kGGbFhB75TSxWaRSI0rQzpgaWd
         sWxeQ1jNT1W+Jnr/DsNryWasqc17MQAcxTSxyes0ck71bRV+evp8luViOCBxxrMQsBRT
         ma2OIggSnvUilZ/xHLDMRlf5sswRI7fTtX7qnCb1piiEr+oXRuxpoFaIxWs3E0g0p6ho
         Ob0ZpAK0LrgplHwV/hriMDcfMMofN63B3ZRClf0vGyCqT0E8aUV7YWXZ2Y2ZCoCL9FQ2
         uTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405034; x=1774009834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3GFh0qpkwl9z7+vFu6yN13UEs6c8A9nSty3yTW7bzI=;
        b=owS/bJsoUVnh6QSIiAl7rAbrgPfjVnezxBDmf9PrVyqyUiqhzlpASvcomVxK2w3eMA
         s4hGAXb1WswPN26r4c/ugg6W7XclmzvudSWY4i18ffhK35jw/p7A029sicfg2jlCDbva
         4NMDwkkwb2vSA4T8aB4BcFybIAEJlg05CuiGuNBa0S77sHvlNHmyvu3NtaCMjIgQoHrw
         NFw6bakVa2ymY2N2jsNoWLADn/5ocsHg7BRiJXAGpTVFM8YPpf/nLx9S8KsZ03RQgb3T
         1WbPp7uc5dBz4gfIKc9pXBoMMHne7gNzLNaIZIslWyTFXCimCx3dHxQ0yhkVjH2gfhZx
         Oocg==
X-Forwarded-Encrypted: i=1; AJvYcCXUo+9PL9YjIQYoJ+haifD7ysEkmKn9GS7shP1UdBlqtTgl2qYYOT/Ym/+70VcQP8eCyH6DmBj7tPPOpbdX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxr5QVmt9zpskv4iSfU48QBiKbkq59DYlHNk8leENWisHd0S/i
	xB1lOjMa2oDBw62K7ZbqJKMKnNDm37k01K8y6QpK1UA6BF+cYbWbJSOhdRPNASizP7US2MNgp/m
	Xv11ZlfS0NY01eXmFi+NACpLUM+Ya9xHH5dmZxhDH1s5ex1FP+m+5//dlgBPxrsKpawSM
X-Gm-Gg: ATEYQzzh50/qh8BCKock4e9AnAhLY6DsKqFQFWm8qT1b4d6nVO0NUwfRLUx/gfQIhht
	2FwwMHZM+RfWtYoeswWEMfqKWBjhhQQouvD4bY17vMc8RxUjuqd6uSerjibSxDJmkSS7ZDCSNO6
	ZpxLNLJBxOGgFDN36zvBZ5LrjewF0NVdfwtF8E0FwrJxGmOhuhBq2iGWFy8jKQInztf2LY73kpK
	uSRtXDixKOlItR8wuszKrUTztR9UQCnz0/YORcd0817crVrpryCb71F8vjsTBgJE5cltg7D3KpQ
	C005GZRGfEW84ibHpEkqHWUvJZ/587IEnarJ0sfVQ/+ROxfp+KLYfzsq+nfrsEJF53Bxu+zt6EE
	Mi0TQiAhMISr728VU7JR+vyZX8twjXEFXAzzCeDuLr8yfnW5RDk4QxaksFDdxuR3Hp+Xs6UL6Nz
	fcAwk=
X-Received: by 2002:a05:620a:a0a:b0:8cd:b6e4:81f8 with SMTP id af79cd13be357-8cdb6e48742mr186909985a.6.1773405034543;
        Fri, 13 Mar 2026 05:30:34 -0700 (PDT)
X-Received: by 2002:a05:620a:a0a:b0:8cd:b6e4:81f8 with SMTP id af79cd13be357-8cdb6e48742mr186901185a.6.1773405033923;
        Fri, 13 Mar 2026 05:30:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6639fe6dcb5sm781766a12.18.2026.03.13.05.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:30:32 -0700 (PDT)
Message-ID: <a4ed652e-163d-4723-a6d7-b942d4acd9a2@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-6-a047ef1e3c7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-6-a047ef1e3c7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kywFoy9KssYEM760DbLaldH9rZkL1Dwl
X-Proofpoint-GUID: kywFoy9KssYEM760DbLaldH9rZkL1Dwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfX/ttisPGfLget
 g0a6Mz/F8t4hZZyDgiuNJmdsVtsszhwO6AynkzIGHfjKNxKuiYpsmeAuhrGFmzTHITVqDVMNZpd
 afU5Sz2nm6vsjKPw5jO5VhG6Ea1ExS0dF0KR/aPknP5yN0atvjL7JaZQSgFiWcSWwh2aGHP27Qc
 8riTzS8FSplGzeQwROfmERGnMaRDs1uOjmpOdCgXa9zrVYQ4NYZRQQ/9j1OEDJic773X0e4nED4
 AI8fIQ+0COeBIqamyvXEWe1AqHXa8AUV6OqVPYcnMITFXnpvDMFIil+jm+EIsVg2kkfXXn8gDGJ
 VRukC24mnNfByLvw9TURl4rzyvHd0NQvw7iVtHHsuUosexBRvRaNDhQbLo+fE7CAzHLbESubS/S
 zh8KTruF6oZg6EonnLKIxJgoT9JXL2jIiZcFkRjG7QH89Z/ag6Gi5WWAC+kU6RCezsIjqOHDMfC
 GL9PLv/sTj3LhejzknA==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b4036b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NMZvMjamZalpy3N7dnkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97470-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C0872830B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 4:14 PM, Dmitry Baryshkov wrote:
> Enable video en/decoder on the SM8350 HDK board. The firmware is not
> (yet) a part of linux-firmware and needs to be extracted from Android
> data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


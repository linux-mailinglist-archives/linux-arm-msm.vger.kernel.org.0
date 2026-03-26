Return-Path: <linux-arm-msm+bounces-100062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJQCILr3xGmC5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:09:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B9331F47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7BD7300B777
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67D43AF64B;
	Thu, 26 Mar 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erTIgXXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8eGSPVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C0C37B3F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515712; cv=none; b=gzXhkMi7DTHJwvxuwCo3ilkT0oEn+KieXyTn+sWnikdPCqUMz6MPw+5JL3zP3bPIPUO/J/NyX1lAjOJl0MH93EKAnxsxDLEyEMr2zz6Fv15wTa+/m0/3Ot6cX78uktyjAsSFATAu+uXP1bHIEPllZm5YWprCh1zoP+3DCCQVxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515712; c=relaxed/simple;
	bh=8BV78OzUJnjd8dgqkKXNuE5mAG2V/G6kGOC05Qcr1Lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqsoFiTCyBF0ZfBfDOsHB4W4SPn7OKPP5UI5mliVYqKdp1MhWWGHNN3qREWj/ep1+uWd6wDusvPWqBSEiM5ddgYLDZQvg7gNa5Zi15S95pivF+zDS/F8F97XOJIUS63X5lRddFPepVX3OgoTGHC/V53MAehdzdi0wg8IL4FDwec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erTIgXXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8eGSPVf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7crfV2887704
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVD833rXl679fejlc5rkodKNHNn4ydrIaFRAgsku4LM=; b=erTIgXXzaly5BC9y
	iUvSXFvd0hEhB1bD66c2CJbhVqLfIku9bGEzTdlpAWhuSkGSP7Bb7fdVK63c4/XC
	j3HGu3XZVdUATcIwh8rAdBn3yfc4VRS//mjUoEF7X2g71yoz4dCqkScXID/aE/8v
	P21na+psMCvAC/V85KS3ROjfPNz9n2jh09SOcm4ajvPJ7eCIBLCo5oFst/uecmsD
	0CGA0uRMPb7Pwkj91Eyfl+JCCqLX3+VAs3LyPynvRFfPxW+F/Fe7eUCGnlN8hPjV
	6rNHNH5I4xl8+mr+uqy8oMp+82RoHKs0sLoZl431ka2Zht897JNGk54+RTgr5cmn
	SwLlDg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kg89bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:01:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a04e9d4faso1932266d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774515710; x=1775120510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVD833rXl679fejlc5rkodKNHNn4ydrIaFRAgsku4LM=;
        b=M8eGSPVftfik4v/fjStTmO/NAJ/mGY6O3QFWMu6D2v7NNZGl3VibsBI5BKZSqsSsRQ
         LWqiX22NYnnERg7Abg2sBoTC6NDmRRiR0P5kDjmwY3mpdWxqDoYKalp4o7QSVNwLQl/N
         7ZcT9Ci74t45tU7+hdf2Wo64f1SYAqROxcaorSs2VvPHkaeYg4HiDA/zjTTOjDUKDlz+
         3Pq/DN6uWpA8SZUhVc8Q6p07xFmOy3Xi9/xdusaUntLZMjAkavSJ7uSczow/ZTfosk6P
         4N3O0oUpWoONN4DnTluqmVEQeXj+LkhdIMMwcm6pnSwglDqU7xpLx8knsbij5knWTHGk
         YegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515710; x=1775120510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVD833rXl679fejlc5rkodKNHNn4ydrIaFRAgsku4LM=;
        b=LxCKS1xFdeF+nWDZLBTKfXdXv2vDG5uZSG3Yh72AmGcVjr+9Q/bRr5mCFT4KF4DxJX
         ousYM/Wys4Rdv7zxxGr6Z8Wy+Wngqwq4thK/kspdEgp/ZPWaRGoRFLL6K12NEBXnjnxF
         wUy1iShZL7O5QtT6HJPUjXkxOrrIbOr5Ejcieo2YZ1bPApnzxgyfXAbFjWDC81qdagai
         FY/FOd6hDv7fnw5olpNdRHjrGyV8GbmmjPZuWl9955ZAyNK0V3ntgwJM4ICedX/4BlJY
         Sjt2w1snhU9sSa866+0YBELTBh7nEiyycL+HWwZGRKfpvzwILnFmCAtNJiQGipmvHLXv
         KlDg==
X-Forwarded-Encrypted: i=1; AJvYcCXsP8v0PKRp7qfEiIQ5ux0wPpgPD++Goqg06ptDVzBbYVmYqaCfZNNw1LVjsZ5btI+lK6Vd49dErP0Q4ikm@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQVlaULBxcCIiltwW1hHnkUeXpW8DIuio5l4VBi2HgpZ4Ssas
	RnZxw6ARB0lJYI/M592QS8jVKItohsHlI0HZjhyKQt6JTFGPeVlfmgGTPDxn92Xo4zflNLN++T5
	YWWpt9UoSPUD1m80UVCaMvyxp5LvlStGD7UsP5aDdNqcPRwKAnJgVjw22lz9vtAl8i+PoQPlPSW
	WZ
X-Gm-Gg: ATEYQzw/Y8YVtus4HystphbEG/s7QfeQCL7ZNHVf1dIw8DnM7ugnxlBX6DkvHz1h8MR
	JxCD9hQrdNhWFn182gUmanHln6Ao7zF8N+viBrEwdv2MTBCggP/JoZEP700NGOyDMpgKETMY3lc
	nMZwnhr7j1lCj7dI57MjGs2evbJ6Jr0k0UZC7FmMC6hF7lmvncv8xvcctSoxmPi6SAvvo9GNcTj
	w+2fja9paaXuOjH6WfNvdtj62dFzr12Tv7QZfEtGcIR89IdW6LJk7wV4y5qa21h125YnhTM+bY/
	iik/ND4Jt8jrHnbKOKHNP6N1TVLKlIhO+GnloIResGeRKZKOvm6tWZ201Kl8q94alA1fc2nukeK
	Xz+qjoTToOgOTXgcLdzoiivklA8SMTOIWROZUCSvlWJAfuu9i1J/Pflna2pa9gCbfTZp1Velfqr
	pA6Cw=
X-Received: by 2002:a05:6214:c67:b0:89a:6263:feae with SMTP id 6a1803df08f44-89cc496bdd8mr71021146d6.2.1774515709539;
        Thu, 26 Mar 2026 02:01:49 -0700 (PDT)
X-Received: by 2002:a05:6214:c67:b0:89a:6263:feae with SMTP id 6a1803df08f44-89cc496bdd8mr71020086d6.2.1774515708327;
        Thu, 26 Mar 2026 02:01:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef95csm87469966b.52.2026.03.26.02.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:01:47 -0700 (PDT)
Message-ID: <b43c3e0e-33e1-4ddd-8415-2c11f6ecf9c0@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:01:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT
 properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>, linux-bluetooth@vger.kernel.org,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-wireless@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-7-948df19f5ec2@oss.qualcomm.com>
 <a75f80bc-d2fa-41f6-91aa-8252fbb415e6@ixit.cz>
 <CAO9ioeVLy_Uzn7L9MyET5wg8CMR132+Dda5JzjdAB=6vz2NEMg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVLy_Uzn7L9MyET5wg8CMR132+Dda5JzjdAB=6vz2NEMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c4f5fe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Mao_WS8moKRl95PynMsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NSBTYWx0ZWRfX+mh7kJtCbX3l
 15W0k4P3+VhuwkS81J++b8CK8Z67mbld7omlsfp4/1bqAyxn1ZAZgeV4ZVhe8KJdIkrRnWpm6hV
 wRfVTF4GXOH2GjFrLID9hEDGsLyXkVWiSk/khkjU3QxEJfafemBSa3TyHM3IfjaKgwxe52LfAaz
 /twcFre/+Fyst5iYuMEx88EL7ipyVN7skvrzJzfMiUrh+fq2WIw9OVjfEVbiDLrvtQ/7nHQEcoK
 kWvzKxsyG8u5x5kmwFfAxs5jKNuXJ7bzKd8dgViKWVad1O4XE5Zqmku+jR9+82LMvs1QFdKjFpt
 PKexBxbDzqd2fBk2aXW8R5qwwcLRqjw32NXAvAJ0olsriyUehgoW5jmwaIdQGII/HMRIHUZ4WQY
 NNh964WrbJos3Rm/VSUG3SULRqboUX4kv9DPw6OMfFIBA/WnPP0E1IlqRZYlKTdo00O13AvizJ6
 5w6jHwS2PVay+ZSobfw==
X-Proofpoint-GUID: KVL2DQcfeg3kYSUmlxbAns-pSoVIGJM1
X-Proofpoint-ORIG-GUID: KVL2DQcfeg3kYSUmlxbAns-pSoVIGJM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260065
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,quicinc.com,chromium.org,lists.infradead.org,oss.qualcomm.com,holtmann.org];
	TAGGED_FROM(0.00)[bounces-100062-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ixit.cz:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 592B9331F47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 2:59 AM, Dmitry Baryshkov wrote:
> On Thu, 26 Mar 2026 at 02:02, David Heidelberg <david@ixit.cz> wrote:
>>
>> On 19/01/2026 18:08, Dmitry Baryshkov wrote:
>>
>> [...]
>>
>>> +     wcn3990-pmu {
>>> +             compatible = "qcom,wcn3990-pmu";
>>> +
>>> +             pinctrl-0 = <&sw_ctrl_default>;
>>> +             pinctrl-names = "default";
>>> +
>>> +             vddio-supply = <&vreg_s4a_1p8>;
>>> +             vddxo-supply = <&vreg_l7a_1p8>;
>>> +             vddrf-supply = <&vreg_l17a_1p3>;
>>> +             vddch0-supply = <&vreg_l25a_3p3>;
>>> +             vddch1-supply = <&vreg_l23a_3p3>;
>>> +
>>> +             swctrl-gpios = <&pm8998_gpios 3 GPIO_ACTIVE_HIGH>;
>>
>> Do you know if the GPIO is common for whole sdm845, or it's only recommended as
>> reference design, or nothing?
>>
>> I did test defaulting to GPIO 3 on Pixel 3 and WiFi works as before, but since
>> previous downstream kernel didn't touched GPIO 3 at all, I'm worried about
>> toggling unrelated GPIO.
> 
> It is an input-only GPIO, but nevertheless, if you are not sure, just skip it.

I think you should be able to observe its state and deduce based on that

On a sidenote, 99.5% of reference design choices seem to hold true on at
least 90% of devices

Konrad


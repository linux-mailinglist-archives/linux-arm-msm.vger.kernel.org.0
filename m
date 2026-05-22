Return-Path: <linux-arm-msm+bounces-109324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIUSD6xcEGqDWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:39:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D42555B5539
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0D993036AC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7843A8FEA;
	Fri, 22 May 2026 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRf48Q3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILfb2R2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D03A6F18
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456423; cv=none; b=dzUEUwkkk/uy2U3EVc8V7nyrKv04btEqCtA5OnIYi8+mbU9Db4CBHRdFVX0Jq1wfU2uU2XkBM5rxyphdvRqXgSJBhZKGSFr07jZhwt+/29JWZRP4B6TpC5hQNgW+5IRVHunyvLVT+BteLUIOw7MAjP84W9TdUCRV2k9zihijfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456423; c=relaxed/simple;
	bh=LmqK5rRmLSD7uS+kzV59AD9BkgWaK5uElWhr0Xw6qWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJx/YFlWT9gDmILW26Vjy7ia9p7Y6xXOnmD8cjZ/keOKqDnqnJS09zra5JZ5Ho/I+VsbtfDQrpmN4HLfrdLms2mopD3fLtOd/WIR9QmssN+PLAgK+YhOUiz7flO9UmM0uCEpEIvUpbG08Gm/M0CUMCaVsLjpRJnu2RQ72CRp1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRf48Q3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILfb2R2k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4HLf3947594
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=; b=QRf48Q3QxwtrM6kO
	A96X7cZMx2OOdjIMHEEMgzzfE5cT/fGVxYSmVDzcEy0WDzI6v6e5wEEOA2swkgs2
	lyL+WA+aq90Mo3+BIEt3WMlcbjWLCAnXFN41MzKmZbwgGSeONrzJrADDEpPiuI/A
	gXQgHJNjP+F7tLviU6cDBTBKJ75UJ5ZrKJf+xGxAUyQwGkynZsxoE9ByYVLG2+HL
	v8wzfobUxneJN3ZqzF/JMEu1O0xRjdG3km0zfOiaKLtVbYiOrSFW4lzGeiAUfwX6
	Uy4YyjC63Be+sQs8h8QTJCSNhIMRDROU0QKJB5nNPgc2z3wQfVcNppBDRJrkqeKl
	OwL8Qg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngnpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:27:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b5cc5cd2so22652841cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779456421; x=1780061221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=;
        b=ILfb2R2kjJtcsZP2bMfXHj+0On/T7822/2mDlExdP+8wWcy6ZUE+EPCAc583CS8ICm
         hBUJGByOKYRRHH9OSvolLP2cv8lqZKIZSM4lnp+QHGIRo/IKG4UMJTbER5hiTdIsjW3s
         mhCt7F70G8aj6Sww3jzCgGD16VcEUtwC4skMgi7ZlOArDQvT0MttGt6MZ7/Zr+0YGScp
         FCahHb5t4ZnXaL5Kzq5TyMDVwoFyUI80LPk6jCCnH1kpAdASwUy/7X78m30tLUdjWn9i
         W8wYMIu3TfssWS3/t5GKnwl5hISf1b/n00OPUT3VabE72VTt8VsAhs8e3vY57m6HdCoz
         3YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456421; x=1780061221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=;
        b=lyJmyMbz2UB5+MpUMat72gqoakwgN4+d83mBEb5qlNo3VV+dRPASk1gIHcFG1uap4R
         jeGX5Qtw5vyjyDHohQrJV5ERmYqq0NFOXiIvMz0s1KxMYLcIa1KN4nA9A5WfG8dctybk
         dFjEIck9Oe9Kfb58Gn+iS++s4o98b2Sr0Zg3DgtCNoThRsgPGtHD+XsaTnRkgJbUqfgG
         BomYECA+Hs4cAJYYMz5RH5bTMM6Wf2qQw0x7cAOFBoNJ0TWHZSKc8t6/mTkEwm+DG1fO
         AHc2q5Mdv9vNoJIRPUzOaGFIKNs45EGQ+V1Q9YJexcdFmlt9je/v0wXXEiKNCoxtcNCj
         O9bw==
X-Forwarded-Encrypted: i=1; AFNElJ8COicMtfIC34QIs2BzEMKrTMAv4DxuIr0PmLD1t2ZjBTpQ1TSCw4SCp1cSJhL4Mu5RS/yNS5NV+kp6Pj5J@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpiFTHflfvpSD91Hrla6HqOeoshDkRrJPVHoOANvdObTaLwPr
	fNhl3mjf2s8Tu6BykOSwxj+N1kXUZJCj76xkXHQ778gx8Mgjr+D8dE8HndLMo7nahamrC5ress1
	IUAduXvR3a/bg1mBOkmOsf5lr/vc3aHPrEbIuRnufKQlWQ4+B30VE4ZLb6eKjD63//a8z
X-Gm-Gg: Acq92OHKnzJVlsY4FfweZ1w6XnNqfivpmUW8MV41KQ5YlRbPl6JSWS0+dVFwOeT9KTJ
	iCH+/Jbe223hMyD/6RpBn0w1WmhZQCl68hO5rWJhmRnlRln0JwhpnIAt0G1/EvbxyYM0lVrtxID
	4ZoVDPDErUc1rt88yDUuPVxcjKRCWuA5WY8m32OWn8Lmthj02qZqt8fePPpaWEV69YbXvbHXHz8
	Zm2t+JDMd+xq8DUT9v9eExlV++MDKLFjkvdjZoNtyyT4sL1Aw2Y7EwLOQHKNEzRP6tRxEzyPh5c
	bciepV+b3RPUefa5AWECP4rqbki9qGGZWkLENlAzL+vnbqvQR4YjnGND6atRYwSiKP4qZ0/3Pxn
	8yNUDF5dRdVY79dIwI55U7DWfIB6ZYC7H8dOyAiHw4l2eXw==
X-Received: by 2002:ac8:590e:0:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-516d4390a03mr35297571cf.5.1779456420122;
        Fri, 22 May 2026 06:27:00 -0700 (PDT)
X-Received: by 2002:ac8:590e:0:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-516d4390a03mr35297081cf.5.1779456419493;
        Fri, 22 May 2026 06:26:59 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3050fcfsm54570666b.20.2026.05.22.06.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:26:58 -0700 (PDT)
Message-ID: <366ec7d0-76e2-4658-919e-da650273e9a7@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:26:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a1059a5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=wa8d-JAsDJw_VMoGAEIA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: JkO_pkEAxu6YPiIUcAWX-EyqL9AcrjKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNCBTYWx0ZWRfXz/hfkgZZ+p6e
 uqqn047usubklXSTCTWJ/bSymjuGcXPhjdwElauQbR5mxo8kvfJGBNWkm5hTMs19G+UK2unLRyB
 l+pql2vB/5OUcxG6I7gkOy+i5JMGKW3Y1lxMhvDzzIj6epcGsZpSb9sv2Df7dKW98BWabHZgXXF
 zfHxCptCP7B4MTPBdseWlbYHiCPokA+lp5U+5UuteQwjoGBviIVFFSh/jTrrJThF+AyzTmed19q
 JmqMhnkKfXHP44zhaK4cIQtOvXncmcqhZb0Y/2JcbTbnbJxF+lAQ81pp91P1SVrSvrrloKI2i2r
 Pjsa1tHGEF1KLLi+/Wzp78GkeICFneRgYf1VeVrJybK+oXYgDs7PdIVd896XG9kdx4BU17Mh//3
 3gdtEb0fJvA72xeFFtjqrIVyixi8KFVFH9vv2etekCTwZCbMx/LcDkmtm0aQHtGxWt89iDmff2g
 pitMC2shq4XxeaolkfQ==
X-Proofpoint-ORIG-GUID: JkO_pkEAxu6YPiIUcAWX-EyqL9AcrjKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109324-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D42555B5539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 2:39 PM, Luca Weiss wrote:
> Add nodes for the two AW88261 amplifiers, for the top and bottom
> speakers of this phone. Hook them up to the sound card.
> 
> Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> RFC because the AW88261 patches aren't merged yet

Are you sure?

for the patch:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


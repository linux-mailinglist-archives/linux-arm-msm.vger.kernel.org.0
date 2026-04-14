Return-Path: <linux-arm-msm+bounces-103082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJFYOo4I3mlRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:27:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5213F7E21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 012E5300A618
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BD53BBA12;
	Tue, 14 Apr 2026 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+Y6CQOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8qQPdL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A36C3B9DA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158860; cv=none; b=HQbA7S5fB+RNgoKoExDeYOBNN6xfT2ylSIxRbBxnhCAgyKy+zSgiuIU1DF7p6bABgw1lJoLhYf05HVqU/M+9RzLNaeZ+P7bm1MGqOCH9n4bbm/CgLKzsXAVJH8sd3cZPP/Ob7TrfXdi72KCAmBPqUig81CuVoFBiowlej3u4HBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158860; c=relaxed/simple;
	bh=4+OZXRJn2PTrFB3cidnhlXmOLT/TUxoYTbD5SdiW0vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTSPeIQ2eOK2LgAaxalqHUDfxXJUrPBWdjJmZE67m/C1W4YbSqWFIng2TMmQ39UvQm8oLS6kOIn8yRKzWjeJ17p+P/SLzrFfOIwVAvcjhCVLByiTr08mWvVu70+agXPuuhjNb1rERikaNUlnNDwGMFkFrJ1jQXNmWC0mJ4eplWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+Y6CQOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8qQPdL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6hlgs967775
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9NYOzs3gNV4L5c6n1IErZjssEPAfF6D24GIAKU8Q4w=; b=h+Y6CQOHmqD3430D
	Fg+7KdpmH0tqpl+2HeWW9MoPmj7pAHW8ZnkB7dVwr1XRSwts6SPcnhwdowJpE+x0
	NDI1ZuexHZY6LE9WTGn8r+qQvsjIIOZAuUZ95l9R3psnfiTbs6bOuTB53UAezKhT
	L4Kxhte16DnlO2LbB99ZYyGqQ4iWMSlXNk6lJ2sTfm22ry5zzauggn6fmG2YFugG
	S63dJ1WRk2hzs/qjyoupI/0eSHa5NodVD2trkgJoO0BxfjDe5P4JRWrdWL1iWZHd
	yPYjN5n4X87bIFp7STiWASK+KqN4KIeANEqPDuroYkOsC0y/RHjAPea+zCWt2OTO
	UyLMNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v21cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso108274285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158857; x=1776763657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9NYOzs3gNV4L5c6n1IErZjssEPAfF6D24GIAKU8Q4w=;
        b=H8qQPdL2QA2zso5hD8kJ71eJT7KXeQgOKRQ7latvXfz8AsWYqWOqmR1TBJxUTF4F0x
         +y684pNz8PqX33UpNATzuEOH+Y5Tc6DQu0/PDb5B1teZremxUycGXbGRx+UwQh1QCqw7
         wv5SCEvj1fvc6FSZU12W0e9ZtJq8XE2hfdTOYIGYw+tGoCwGFxBpudfw87/97KSlN6T0
         Sae+IVrPws+5LefK8i7QFH2aVU3rPkQfRStF8CYAS7+fRjGKkjuS0EPp2YqrwsLKxtk6
         Z3MM8V837QTyB0eWz6lBBf8a8XV8bG+9/XqfrH7zDqdS1YC5ZzItN2mLbJew5YOWUFQF
         aNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158857; x=1776763657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9NYOzs3gNV4L5c6n1IErZjssEPAfF6D24GIAKU8Q4w=;
        b=RIbRzA/pr+Wsw5reb2cQBK7kAuJHToCjW90lahPMDz4LKan3zNHklZ6bWkh+n8mcnl
         JurhGZP8du28goM83oImRD7H7Il5+uzncQFpLXnbtAiARGu7xtihM5kcA6A+ooXpWHmr
         hO2rKHY0lKWTwTt7QM49fJMHdMNQhqgRYlfikmplyyGXaUWKYjgqzRcJk0YOkJPUaxbt
         +F9PpRexnHvJWkscHaZiyIUHRId+UEyxYWV0zALVnyu8vhpL7/l2MbVamyBxhoV4gC+P
         gaC45shX1PHdVF0dxVFzro53+DwSoLqVxwazUDmHTsRdn3b9tC1bAPDorbOqF0cyD7YX
         0c0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9cCOOER+hGuqvE6F7SAY8+eJg1TJKLN4w+dYqBYuy+iK6diTQcqOg+kBzR7D3nVJ8VljvH787kWIYWr2yL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxawxwy/2oJ2AgccB09Bdsu7dPEIiYQdg0k32tNPmDWot0MPj8I
	d9bLXDEJG+pYFxglb5gspz766SXW35ZvMLpkvu2uMocZowDdt1Dv8N67Cit795PJ1fm/RrGFg+R
	AkKmhq60Iph4l1hp+BzX2NYTf4bjLmunkmwC7iguP+wcWauwaksE12kKb4SCQ6C6W6/SGfDCeHh
	dm
X-Gm-Gg: AeBDieuN9FcSudtbdaI7g+ExkuQEfFUQeckkM+dypmZ69vG4b34FIheoYsN+g9R7MIV
	GI1sFhgMSUvGx0dhj1v0fk9wYY0mGaQreKoCNRXaYg0MP1jKYyDpc0Bx6/EUwCoQEq0bkML/qXQ
	SQZuCoj3gkdQx3aBdKRnJCM+ZdMSnS5OFIE/EQN620v1EJcnUsDu/bB67YgqDFV81xwZG9xealI
	nEbvWm/3QH4qdDF1sMhy3qErsxALMwImtBj9aYlc5v0Ro3So3AqoGpqtdNuSuS06LYSF0aW+GIw
	S0wt4vjz9KZp1TRXQ1Y5PQrsBsNJOxqPuChMssX2IIkajHEs7LVb+bllhGuputkGgBfGbKKQFGM
	NNjaiFW+DRf4KNijNaKqZun9lpcpqIA9hQeHN0Qf9tYTCTBkFqFsgfhG/bwlLf89l+Tq9BVQx7V
	MXT3y9Ie2v2JGcZQ==
X-Received: by 2002:a05:6214:c6e:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac87629726mr198075426d6.7.1776158857606;
        Tue, 14 Apr 2026 02:27:37 -0700 (PDT)
X-Received: by 2002:a05:6214:c6e:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac87629726mr198075176d6.7.1776158857197;
        Tue, 14 Apr 2026 02:27:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c886asm383094466b.46.2026.04.14.02.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:27:34 -0700 (PDT)
Message-ID: <7fda964d-5b4a-49b6-837a-d8276f688a8f@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Nord
 SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
 <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfX2WylHQp+IHfz
 xt6h+LFQ7l2LZJynmfFZ5cZQLfFJP9RjAVpR5HJPsg9IwPYNXE1+wWi1yfSdu0q6ePLzdyXY0N8
 0Hg0tHpxOD+1KJN/F8vtSqEDRzJWheN1cQXUnjFp1wAxbbC3IcpTldAZhI9Cxq5sqEMSfdIMDnE
 DXWyMA9NNEGJlcgoFhk5vnFi+1ICwgPzChpanvcuczFE39mjcl+IHfW5zfbbNzoU0wH6aHUlJsZ
 ZbWKetGkj7CTe1A0umtCa9OmYZgzfHRal2whK/v5tg5xBu/0pcF8+wT+8XMlpZy2SLNUJynCEB8
 IJgVWi9tVCMVehi5E1ZQzr+A+zxJNVRctd+kvFouzpFHuRk7pYDkI/BwVRsnspUOSEbT20zgyxh
 D2cbjrrdzS4Z+xHluh2A0j0SO1l7ccr9S6VeSKdwOHwjjMfHpGxUU101G66w02vTLJ5Bu4wsNZn
 se8kUJvK3+m/3zKPkOQ==
X-Proofpoint-ORIG-GUID: ofMOgUKp7kBUYJIhHwxot8IKDNw8oB5l
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de088a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Jpqku5WnjNLMWeEkFAgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ofMOgUKp7kBUYJIhHwxot8IKDNw8oB5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-103082-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A5213F7E21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 5:59 AM, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMh power domains required for Nord SoC.  This includes
> new definitions for power domains supplying GFX1 and NSP3 subsystem.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


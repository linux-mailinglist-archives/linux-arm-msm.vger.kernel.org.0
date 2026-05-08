Return-Path: <linux-arm-msm+bounces-106700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IT7NU72/Wn5lAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 16:42:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E287E4F7EFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 16:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8356930189AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 14:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B56370D55;
	Fri,  8 May 2026 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGkdlTJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ0KEhOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD23ED5A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251315; cv=none; b=Yo/LSC80viK5haXUQtL1GkfgZSjvSok3iJR6JaWWKaU4tfp4KKq5GYUV7ta+8pkWN1WtITIMmyoIoSPYs1uCq3/1uoVlK4NUZ6cp/yRA+sMSTV5+Ua32KEk2Dj63P/tD3PxD6yhroLarhCNRJlPusKV2ybnYvqjUkFOgwiPtijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251315; c=relaxed/simple;
	bh=pr96u8fpX27t/b9mvJO/e3weEQIF9Gqfw+8cGBAORNY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=aOReDVmWksg1gb5OrwYiHPXZ32l7sFOgJWVlSLdCN4ngorhGe5R2178SuSqcs0DCDtAOMmYwLFeOSoTFmohnzjG7VwJM0MC2d3B+YGtcadLbeKXz8nLPjpkoBCnYquBh4tX5UWYe75I4HJ+oyM2K330mDgL6V4t/fRbVsiRW3o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGkdlTJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ0KEhOg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AlM262199585
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 14:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIVVKibPHGx2DZJ1/yR4RDqxK0+CG0k31mIdHaLooRE=; b=RGkdlTJw6nwQwk2N
	1L1ixZMmBw/Mi1FGQ+YdLhNLYgz0OnG7tcromWyV5cIBu4VxeO2vHJGMOXGHzjbJ
	/FtkYtFcoidwWmlQ6KcOBKrd80UpwZWdWJ2uApl18wLFZWRylv6jZEmN97aPTe1M
	qjSJWXn5W3KGa8XqexlxXBc+nJAUZxNly51f+VyJqUVSNMYrEK3Tn8COLZHj1HPt
	0SqDSguMxsYiKWLNltkTOL9njUESG+YIMY8PZEaWVIIM8kZu/oycoGFvsK53UC/a
	dpEVVwTWiGEqWHJYa387u7HA9bP1P4rgVSl7uIyDVUXSHhlC18tFmmlYMD9wn36I
	qL5Xng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119skuxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:41:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so2562173a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778251311; x=1778856111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wIVVKibPHGx2DZJ1/yR4RDqxK0+CG0k31mIdHaLooRE=;
        b=NQ0KEhOgTZDSXyqwQ8jENoigrzrYI+b8JTW7I4qNhgvAD1CTRQ6rgHb4PfqUYrJyLu
         YuY08pAZvjI8WD6NIzmmenU8ODB1WErBVuaP15nSFJ6AVmqVJqxuSKgA2t1McUd4y+WK
         S208SMJUFdbC6ge/3kbZWq+6XgTCU5CjN7NtLMJvc6LsAXwg1YMSn9tDGyZdtlYSCZv0
         YwzXTfhs4gx/66aqq0PJf94Oo8DAnS1QHLa19LTuic3VfcSHvpgq1AHxsnHtEty6zKn7
         ScXnwvX3uKMUzn7Hu62nf54V5EhFQpk+M8OjwKInKCX9F/tc9YX6R9BNWe3g0a4wyvqW
         H1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251311; x=1778856111;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIVVKibPHGx2DZJ1/yR4RDqxK0+CG0k31mIdHaLooRE=;
        b=eVGzffyJQ8oWNRDd9WDpRYstukoK+bDMEdVUXM9hXBf/zjiOsiJzn3v5vZ5LK2V3Zq
         +GgwK8WbLExWXJ/XBZGQY97F3owHzp3amgHL5VLGSPK6KvVdB8ZlPGChctDPMS0MJdx2
         AnnvClIVdag3DdgYvVtK1+ts+Di0+vy7PiyQnZ6q5cclXQMDozfNcXgJmhr2VRT5uU2O
         BoX3gP84LoViLH6zT1wZFGMK6mYDx47B0EYjoolHsgLXNSrpKoAT0m/fHURTl5xkuGDv
         tICqC5j0vovFUSpZ6tIW/S8w6THudbt/Mmzx59xRYYnqeR/f16w4ukMexzOLIISkKMUO
         BjpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IoeAKiisLLlIw8sD+WYezpFmJL1jCfRBudxN9IucQKzJd22CEyidKq7h1MDaED76kd6ID79wviyJpXDyT@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+z3ewCyZWZs2sjabVrVhldi71+vJIeUJ/YqkRDEOHURyA5ry
	Ls60dANHfNOh3Dge7WnWdcJwxu9YQj4HP7cG48ttsxDChBGrDLe/aL4d3Y7vxh+YTWXTGkl2bHM
	KszuPI4A2K8805bu8B7Ooz2Rs824QqP0nx+QmUQADdpHK5P7lUuhZyqcyaJjgXFWmvJiG
X-Gm-Gg: Acq92OFo8Ij8J26HnN02vkWIcbEoh5cgC/1cAElCvGXK+6gkpn5P92Jmrw5/6Jwtdlz
	LcD94l7CRsj63Y3OtHNpZWFiRioAikg+6fONgpv8TtgsOBBsmWQE8qnW4Ay/QL6WuxlANuL7b3/
	111aF16raN6pEJVHlF7ZMh211GlZNu0CLa2q1Ug0JDQ2lkhyZohFOn9VMzvHX2Hc1bqqf61eySa
	K+cLNmBknj0Flftkb9STIXDkur+fhFeC9loBBSH0aQKPhQcbsxnZQh6JJzfqPVc8dqgA2elfJK1
	tmbgzjNrZ//H2qEZVYvSG0tHFqct/r04vUxKEOFW31gUBKsVgftV3BL3ZGR68LHRcc76/cw6fNu
	WpnzbnYD28ahcmCD4Ax6KC2n64hFe2H7GaRKuJUTC2SVX4RU=
X-Received: by 2002:a17:90b:164d:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-366346a6cf8mr5460382a91.16.1778251311182;
        Fri, 08 May 2026 07:41:51 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-366346a6cf8mr5460312a91.16.1778251310566;
        Fri, 08 May 2026 07:41:50 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2409:40f0:1188:45b6:d004:fdff:fedc:161b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be8be938sm109356a91.4.2026.05.08.07.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:41:50 -0700 (PDT)
Date: Fri, 08 May 2026 20:11:45 +0530
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_01/13=5D_dt-bindings=3A_crypto=3A_qco?=
 =?US-ASCII?Q?m=2Cice=3A_Fix_missing_power-domain_and_iface_clk?=
User-Agent: Thunderbird for Android
In-Reply-To: <b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com> <20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com> <afmuncmBrrvddHTU@gondor.apana.org.au> <b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com>
Message-ID: <CC0E438D-5544-4BB8-8512-7F93A7FA4DC1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MCBTYWx0ZWRfX0T2o2riMhlRp
 fsyiqu8oUJ7ysnlUlZagR3EvDbBWMZEscwXQ+zM9c9BlGpAxICM6GEMwrlU9tXz39P5pPfFbwXM
 +63UGQ43DIrZBUIpVuTzBcVhrCDIBsCr9jbkTeqlCn1puaX6mhS1HGEsejUn3c4tel0kaAL3t15
 hMP/+h/T+utukLKWxxY7b71KTTCjcUmPG2I3D1RElgEYdq/tlkysdEZRjKfJXdLAnQVjYdvIEUH
 l6pbSA1YVs7s4IaIE8FON5RZOE9NMivgmQTrDuhW7YN0p2Kpu+J2mEB8sjzxTV9wP/WyfIijGAB
 jEZz0CBvcSXq/EyiWEZpEEXK/526lk2En+LTLWLbOh3oFwMKF8Eidlv16q66dRlZnaUq9gW26Yi
 3r8odRBknqpyJ/T4pBdr61atZ61w88pi72ho1ntLj9smIE2giUoWFFklsxGQgKXB/kuB0AAq/Wa
 oNG1FPShms65Gzs3gLw==
X-Proofpoint-ORIG-GUID: lT1iK6vyM2Ihc_wLoLu1oeMiWS5wYQIk
X-Proofpoint-GUID: lT1iK6vyM2Ihc_wLoLu1oeMiWS5wYQIk
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdf630 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=puQWGBksFvoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5CtyM_Wnw1_u-mjX28QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080150
X-Rspamd-Queue-Id: E287E4F7EFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.55 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106700-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Herbert,=20

On 7 May 2026 3:50:21 pm IST, Harshal Dev <harshal=2Edev@oss=2Equalcomm=2E=
com> wrote:
>Hi Bjorn,
>
>On 5/5/2026 2:17 PM, Herbert Xu wrote:
>> On Thu, Apr 16, 2026 at 05:29:18PM +0530, Harshal Dev wrote:
>>> The DT bindings for inline-crypto engine do not specify the UFS_PHY_GD=
SC
>>> power-domain and iface clock=2E Without enabling the iface clock and t=
he
>>> associated power-domain the ICE hardware cannot function correctly and
>>> leads to unclocked hardware accesses being observed during probe=2E
>>>
>>> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GD=
SC
>>> power-domain and iface clock for new devices (Eliza and Milos) introdu=
ced
>>> in the current release (7=2E1) with yet-to-stabilize ABI, while preser=
ving
>>> backward compatibility for older devices=2E
>>>
>>> Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine:=
 Document the Eliza ICE")
>>> Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine:=
 document the Milos ICE")
>>> Reviewed-by: Kuldeep Singh <kuldeep=2Esingh@oss=2Equalcomm=2Ecom>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof=2Ekozlowski@oss=2Equalcomm=
=2Ecom>
>>> Signed-off-by: Harshal Dev <harshal=2Edev@oss=2Equalcomm=2Ecom>
>>> ---
>>>  =2E=2E=2E/bindings/crypto/qcom,inline-crypto-engine=2Eyaml | 35 +++++=
++++++++++++++++-
>>>  1 file changed, 34 insertions(+), 1 deletion(-)
>>=20
>> Patch applied=2E  Thanks=2E
>
>Herbert has pulled out of picking this patch from his tree=2E
>As discussed, since this DT binding update relies on DTS changes in commi=
ts 12 and 13
>of these series, they should all go through the same tree=2E
>
>Can we aim to pick this series via the qcom-soc tree to ensure the bindin=
g and DTS changes
>are applied together? Since the 7=2E1 fixes window is open, I am hoping f=
or this to be
>picked up this week or the next=2E
>

Can you please confirm for Bjorn once
that you're not picking this up and he
can pick it from his tree?=20

Many thanks,=20
Harshal

>Regards,
>Harshal
>


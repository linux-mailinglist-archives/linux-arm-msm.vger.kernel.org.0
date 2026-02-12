Return-Path: <linux-arm-msm+bounces-92648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOkBA8uWjWkG5AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:00:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D312BA00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09FAC3025E44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BBE242D7D;
	Thu, 12 Feb 2026 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBsQP7aW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gq4KczYB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9D4C92
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770886850; cv=pass; b=LCZ3UWPowxEq2HYRDfvp71QzAYwFpDTPzGgdHto54PChKvzDVPdlMJy7RlL82nzOMCt/GceIOfsbhiwrWvjQhQf9yQ5P/n4xiMTGMWkskG5lNpo34WfRZQBbp6j0RqCQbhzXkuo6eFqaeuRtbaQLRwKCwT/lxHk63o0V7GxLEtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770886850; c=relaxed/simple;
	bh=Q1EIJp7SYOLTgc5mWsjQSQSzn4E3p5Ri46f/NqCxmJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UiydOyzcfRlQkSZ0/4IyQ92VI0t/gaj4/TLwrpin4fRmLnbvJEOmXAU/kptB4pYCKs3B4eIlOMmzs9+R2m0S0RwQBezBZDc+xiFdwuIJesdhGzIuB/3sP6S6K6QxcrgzK65d4ub7l8TPDlWBw3FLC2tdhIkbP4+8W6LI73x37lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBsQP7aW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gq4KczYB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3S7BQ2397010
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yPDUwlKhiG/i9urVeDgQMi/IirCeyPEUeVoZVGPwvJ8=; b=pBsQP7aWLPBP0Uk8
	mKWsNiOcrUtlX4RCUmyLeTpgUKhciCeKo5KN/ysClAdNhuGKSbtPNM9wTgyyvyyu
	upNcOD2R1UnCjPaAZxWhyRcJ5/DsRY49KRMarBoXAcAUX53NQ484wFII7KqhmDuv
	1A15cIEDvVK3k8T2Tb1lu0OMK7qYkVYi8ZdGTUJcW2W0KS4cQZdPup3J5mbqjEOF
	36oRQ8/v8NElWOisUN1QC3o1rFiyfOuAHNBcIDgM7tSmzy6WoAczGxs7JFMrR1+h
	p+cu/lAdQLNCd7V3hnZBWqaUuc+xD9tpyC6E6hya1wKY2WR7KLM93v2/C9oq10aB
	iNVEmQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8supbh9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:00:48 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-64ad605e35aso3243086d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770886848; cv=none;
        d=google.com; s=arc-20240605;
        b=XVgWADf/vMC85luYD67GORhPI+zVEuKMym3sfLFldiAlXh+9PIV5GnuZe8hvO+K/Jb
         CSe6bLJcA+p0pQPCEBBPp/BFrYgfkFtdokmfOzYx1rLCA8ZDkmaidLMFwYV4K2jlu3Yu
         x3el+1NhMjw/vsSSztxGds8Kz3CgBw+uQynDIKdDHQrxlAOZ/JYL8DtqpefOOfozeSVt
         zw6bh253fyRgO4w/a81FTwCDIoWuatIqQ3EX1RlLqr7nOzJBTzQBIyHD5P3uXKR6iis9
         q19UJVle8xDrLdA7zLAeFNCuHa7GGR2EtQ8rbFw/RkSwJVNHGWja8uU6tcEmNX8akE1Q
         Ndsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yPDUwlKhiG/i9urVeDgQMi/IirCeyPEUeVoZVGPwvJ8=;
        fh=y0EofmqGhqQpzRa4S9MkjjvZs7uO0HDQOxAePVQh6sI=;
        b=cS1L6SEd6e8uPBJyoOBfCl6O+vc+CLHPDWf5heJbSL2Iz7G7gK95REjha9ku+r6ibR
         KFnEA49em4KDWBdxBA1ixEp7P7Z+PIxFHZS1DhaRlRKLS0MCrqQr/bf5N1xIHSRJ0muF
         xfIHUxDGZFZKUU25NomdYdBPVAoz2vZwU1N3v4thTvO83cDoJAHMrw1LH9RjwjAtLzAc
         mwyKWd3fIcT3TNi/Rcqzn7XFzxLmB22oTq7r+Ob1MNkrCNQsRESm5glLOyQ/8bRB4SCE
         enM8kmDdOLVf9r7o6zitqYZG+uaf5oaUqJGUDMZCLnvl1ndtfY8O/JoFYWtj6Lx60sFI
         TZuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770886848; x=1771491648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPDUwlKhiG/i9urVeDgQMi/IirCeyPEUeVoZVGPwvJ8=;
        b=Gq4KczYB0bqJBs0W3O425OcQtXeM++5gXff2pwn8nHziFs4lOTBn+nky7e5psDU6fI
         7zYnhTcVoeKBdlwdxxtmNrifNN1ypaB2axd1E7YGS3N7InYdCcuNKwb939AN3HLk31BL
         XwunHFuwEswqrTc2IiomBpJH3DlYdAs3NVJ6bfVEzuDpD+wfPGxzmtzcte/K7gGSDs57
         O+1M7X+K/SOJXh0e1N+mVkPLte2NgVuZ0aUIaiXps0ZVrS+QjfqyLvTqyzYTevA1+jBO
         foUaeuS/WOPTObzUcYq2cdMlFJEEC7A0I9xYn/fNGd/Bn7yqObTp+NdabFu9zrEGb+Be
         v6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886848; x=1771491648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yPDUwlKhiG/i9urVeDgQMi/IirCeyPEUeVoZVGPwvJ8=;
        b=aCgWkZ2RhnV5s0yjzatBzSd0+umRtYxVx69O7esaMXaeTSeFfjKftVDJkbHw5wRZlf
         rwIWIUfRwW7SUlZX1bm7OSg7WJ9LhMirEszgXS9d7Rrfo0uuxpVgVx2gB0mhIOvITI6R
         pDUu/n4cT7lJGhbJZQQN8kK/CTKnrSI+1Z/TJR84UHS4zntMAuKeKrE8l/NQ/UJL+ILs
         CcjggP7P+z3Dhc9Vsj4Cei1wcWgQDvuwxjQgvP+jAhrvD8PuTKYfLzNrg5LCo2pisUhv
         n6NKaZkypqueSE1Wn9h+VDj5FW5sQxOkgZg02TRDATBSVoEFrrGjauji2g59Bp6bXby+
         1vZg==
X-Forwarded-Encrypted: i=1; AJvYcCUjIM4P9zx8ZzU/kCt+jheF7OdtO8avSMoMbd7XfmTU/KHJMvjsMt3Id+nr72wKbAFSITkr5/Oh5kah6Rpo@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEPlAylLQoJGfRPQtOeUfhMYvm6272OHWUJt9A1zAX3IF0ZI5
	6U6HhpkSmMuDrbvn3eD31luowizDYuvP7CAhikv1SL2w0VNLVKUDCiHPdxsl+vD7END9hfBTxhQ
	GCEfaWP4zZA5/C+LJ188buSzJPIEnc+68WAae93kHci0jONFg4M7wwGGfzioU5HFRlPxdP7y4h1
	lMOxbHUBSO0Vatk5CDTVqj3XqOvj9ymO+Lt1j4vm6KMms=
X-Gm-Gg: AZuq6aJf4k4aM7kxKb7obf3l+01lM9qLdamnlYFx5xescqttOqLnU2CDv0KQx9+h98t
	V1qmTJCNzY9RxwNYPJMiRXDsnf34AwKk6DShPRmL1dbT584ccQhX9FQ5A5LOxEFpWWrHxrgJJ/8
	4p42ARN774KVVRqeP+6e6u8D0AsHF9pQB3BYjy3qGGL6pp+oMvgxjuPz0U4lH+xUMQSj9kPB8qT
	ka+qCSr
X-Received: by 2002:a05:690e:160f:b0:649:443d:87d9 with SMTP id 956f58d0204a3-64be6bdeb8bmr806943d50.40.1770886847696;
        Thu, 12 Feb 2026 01:00:47 -0800 (PST)
X-Received: by 2002:a05:690e:160f:b0:649:443d:87d9 with SMTP id
 956f58d0204a3-64be6bdeb8bmr806914d50.40.1770886847175; Thu, 12 Feb 2026
 01:00:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com> <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
 <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
 <fycr33dqcosay7ake3nbbeaclhqvynwzixas4u3ocaerpqbu5e@shoibdd663vm>
 <6a982b56-2f4c-441f-acf7-a8e77ea55600@oss.qualcomm.com> <421a0916-ae2b-44a2-a3bd-ceca0737f334@oss.qualcomm.com>
In-Reply-To: <421a0916-ae2b-44a2-a3bd-ceca0737f334@oss.qualcomm.com>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 14:30:36 +0530
X-Gm-Features: AZwV_Qj3ch3wFyAWtGjMjHFbsd9TEvRBUW3H3X-iLHwm6-fa2OdULd1wqQnQ2f4
Message-ID: <CAEiyvprpC-kZqonKJxQtVLUH1Yz6_U+RvhJ-s-ywotLAGYxX4A@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NiBTYWx0ZWRfX4SX2ULQe4f4X
 t7sN/TWAQ8xWobUkorjVWtPpPpDyAuqt7UIGzG1UNFg+csUg3KeWJAbIbQWGiHkIhsquoYQvQl1
 xZa9lX/0uzlFdIEaYubRK4dIUISLvj6raIbtUHxNC0BRp8ix6gU2rrFKfZDXjwm0moyYczrCA9p
 pgx5SR4T5bk4rzh2Xe53EHbfLnNASaKaJI43xVIRBtyprElx9UmrhFJhH+zCfvkjwclePub8fr1
 kPfObUCcDOZX01sdGsqBOYZc6GEziJeblwOOOi4snXNH7o8XR6+vOQq6IC5sVzp0FByBoJucpWo
 4t9/MoAYkROsvWoP5fOM6rdGElyh1v48lEfgjBX6X1kcfvVi1JCiyjqqRtZbZvNUw60VGcY+4Nl
 3XxkqISdrhNHyzhG7K/avns48CeA3zlrfNLu8zFQUbkXryy9QLa1Hk85eAjAGvgM8U7oREaBVTt
 53s3LPPAtmcL0CxkJQg==
X-Proofpoint-GUID: nTZJa3TI3CuXjq_sr22JwKWBltuBqW8T
X-Authority-Analysis: v=2.4 cv=Uslu9uwB c=1 sm=1 tr=0 ts=698d96c0 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=DDo8cz_evcQAFXMts8QA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: nTZJa3TI3CuXjq_sr22JwKWBltuBqW8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92648-lists,linux-arm-msm=lfdr.de];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[0.0.0.2:query timed out];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[0.0.0.1:query timed out,0.0.0.47:query timed out,0.0.0.2:query timed out,qualcomm.com:query timed out,oss.qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[dmitry.baryshkov.oss.qualcomm.com:query timed out,port.0.0.0.2:query timed out,konrad.dybcio.oss.qualcomm.com:query timed out,port.0.0.0.0:query timed out,usb-typec.0.0.0.47:query timed out,port.0.0.0.1:query timed out];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[qualcomm.com:query timed out];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,0.0.0.47:email,0.0.0.2:email,0.0.0.1:email]
X-Rspamd-Queue-Id: AD7D312BA00
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 3:04=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/4/26 6:56 AM, Krishna Kurapati wrote:
> >
> >
> > On 2/4/2026 7:03 AM, Dmitry Baryshkov wrote:
> >> On Tue, Jan 27, 2026 at 10:53:46AM +0530, Swati Agarwal wrote:
> >>> On Thu, Jan 22, 2026 at 4:02=E2=80=AFPM Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> >>>> On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:

[...]

> >>>>> +
> >>>>>        edp0-connector {
> >>>>>                compatible =3D "dp-connector";
> >>>>>                label =3D "EDP0";
> >>>>> @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply=
-0 {
> >>>>>                enable-active-high;
> >>>>>        };
> >>>>>
> >>>>> +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> >>>>> +             compatible =3D "regulator-fixed";
> >>>>> +             regulator-name =3D "vbus_supply_1";
> >>>>> +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> >>>>> +             regulator-min-microvolt =3D <5000000>;
> >>>>> +             regulator-max-microvolt =3D <5000000>;
> >>>>> +             regulator-boot-on;
> >>>>> +             enable-active-high;
> >>>>> +     };
> >>>>> +
> >>>>>        vmmc_sdc: regulator-vmmc-sdc {
> >>>>>                compatible =3D "regulator-fixed";
> >>>>>
> >>>>> @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
> >>>>>                        };
> >>>>>                };
> >>>>>        };
> >>>>> +
> >>>>> +     usb-typec@47 {
> >>>>> +             compatible =3D "ti,hd3ss3220";
> >>>>> +             reg =3D <0x47>;
> >>>>> +
> >>>>> +             interrupts-extended =3D <&pmm8654au_2_gpios 6 IRQ_TYP=
E_EDGE_FALLING>;
> >>>>> +
> >>>>> +             id-gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
> >>>>> +
> >>>>> +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> >>>>> +             pinctrl-names =3D "default";
> >>>>> +
> >>>>> +             ports {
> >>>>> +                     #address-cells =3D <1>;
> >>>>> +                     #size-cells =3D <0>;
> >>>>> +
> >>>>> +                     port@0 {
> >>>>> +                             reg =3D <0>;
> >>>>> +
> >>>>> +                             hd3ss3220_1_in_ep: endpoint {
> >>>>> +                                     remote-endpoint =3D <&usb1_co=
n_ss_ep>;
> >>>>> +                             };
> >>>>> +                     };
> >>>>> +
> >>>>> +                     port@1 {
> >>>>> +                             reg =3D <1>;
> >>>>> +
> >>>>> +                             hd3ss3220_1_out_ep: endpoint {
> >>>>> +                             };
> >>>>
> >>>> Why is this port disconnected? It it really N/C?
> >>>
> >>> Hi Dmitry,
> >>>
> >>> Sorry for the confusion, Can we do it as follows:
> >>>
> >>> hub:                    Hd3ss3220   typec-connector
> >>>
> >>> usb_hub_2_1 <-> port@1       port@1 <-> empty
> >>> usb_hub_3_1 <-> port@2       port@2 <-> <empty>
> >>>                               port@0 <-> port@0
> >>>
> >>
> >> You still missed the _why_. Why port@1 of HD3SS3220 is not connected?
> >>
> >
> > There are no remote endpoints added in dwc3 node. Since we are making d=
r_mode host. Hence keeping this remore endpoint empty.
>
> So can you like.. add the endpoints under that node and problem
> solved?
>

> solved?
>

The lines go from SoC to Hub directly and not the port controller. And
hence can't connect remote endpoints of dwc3 controller to the hd3
node.

Regards,
Krishna,


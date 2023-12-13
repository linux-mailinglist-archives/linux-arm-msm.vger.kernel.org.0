Return-Path: <linux-arm-msm+bounces-4494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE428107F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 03:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72C852818B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 02:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8B010EA;
	Wed, 13 Dec 2023 02:07:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA2BAA;
	Tue, 12 Dec 2023 18:06:58 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=guanjun@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VyO8iev_1702433215;
Received: from smtpclient.apple(mailfrom:guanjun@linux.alibaba.com fp:SMTPD_---0VyO8iev_1702433215)
          by smtp.aliyun-inc.com;
          Wed, 13 Dec 2023 10:06:56 +0800
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/1] soc: qcom: Fix compile error caused by uncorrectable
 definition of TRACE_INCLUDE_PATH
From: guanjun <guanjun@linux.alibaba.com>
In-Reply-To: <kulysgxsa2lazwpbmovqtide3kvt6qq2dwtxmmi3ugznteo233@67ayvx2lduhi>
Date: Wed, 13 Dec 2023 10:06:54 +0800
Cc: neil.armstrong@linaro.org,
 agross@kernel.org,
 andersson@kernel.org,
 konrad.dybcio@linaro.org,
 linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C315830-A476-4B85-A132-6BEC7E1983AD@linux.alibaba.com>
References: <20231209074716.2689401-1-guanjun@linux.alibaba.com>
 <kulysgxsa2lazwpbmovqtide3kvt6qq2dwtxmmi3ugznteo233@67ayvx2lduhi>
To: Andrew Halaney <ahalaney@redhat.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)



> 2023=E5=B9=B412=E6=9C=8812=E6=97=A5 =E4=B8=8B=E5=8D=8810:44=EF=BC=8CAndr=
ew Halaney <ahalaney@redhat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sat, Dec 09, 2023 at 03:47:16PM +0800, 'Guanjun' wrote:
>> From: Guanjun <guanjun@linux.alibaba.com>
>>=20
>> Compiler reports the error message when compiling the file =
drivers/soc/qcom/pmic_pdcharger_ulog.c:
>>  - ./include/trace/define_trace.h:95:42: fatal error: =
./pmic_pdcharger_ulog.h: No such file or directory
>>      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
>>=20
>> TRACE_INCLUDE_PATH shoule be relative to the path =
include/trace/define_trace.h, not
>> the file including it. Fix it.
>>=20
>> Fixes: 086fdb48bc65d(soc: qcom: add ADSP PDCharger ULOG driver)
>> Signed-off-by: Guanjun <guanjun@linux.alibaba.com>
>=20
> For what it is worth I sent a similar patch (which handled this by =
using
> the CFLAG -I recommendation) over here about a week ago:
>=20
>    =
https://lore.kernel.org/linux-arm-msm/20231205-pmicpdcharger-ulog-fixups-v=
1-1-71c95162cb84@redhat.com/

Sorry. I didn=E2=80=99t check you have already sent the fixed patch. =
Please ignore this email

>=20
> I keep disabling this driver locally when developing (or picking up =
that
> patch) until something gets scooped up.
>=20
>> ---
>> drivers/soc/qcom/pmic_pdcharger_ulog.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.h =
b/drivers/soc/qcom/pmic_pdcharger_ulog.h
>> index 9d5d9af4fbe4..3ac994d160bd 100644
>> --- a/drivers/soc/qcom/pmic_pdcharger_ulog.h
>> +++ b/drivers/soc/qcom/pmic_pdcharger_ulog.h
>> @@ -28,7 +28,7 @@ TRACE_EVENT(pmic_pdcharger_ulog_msg,
>> /* This part must be outside protection */
>>=20
>> #undef TRACE_INCLUDE_PATH
>> -#define TRACE_INCLUDE_PATH .
>> +#define TRACE_INCLUDE_PATH ../../../drivers/soc/qcom/
>>=20
>> #undef TRACE_INCLUDE_FILE
>> #define TRACE_INCLUDE_FILE pmic_pdcharger_ulog
>> --=20
>> 2.39.3
>>=20
>>=20


